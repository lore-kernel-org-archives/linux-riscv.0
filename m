Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784DFC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoJlLiPbasIOEzYVKy7o0GQldmIU/m5VppWqnmKVBo4=; b=Pfpw8EOLiADdjf
	Az7eBQTfxlvzK/23yQgBxpvbEEAl6lz+Big38vryFPKFEsYROJ9sM/f03pbraWAoylsvC1lAiUYUn
	ptTs4K5DmmclLXdDYHeqryCkN8KPvOVtL66NPxKmqXEzM3PnOwmx4haSzvXWlwfQMx7z9UgepqAzT
	gnUMvoNFwGzXRXe3pPUeLIomPGH91VcFmbDXKPagM106tZf9993s8QV10OTmKK8ZeX7oSjxsXajZK
	lxXshoppAkpdOLsqbDJZQftI00e7jTnWF1rQ6GGfhiQ17bNfYFepuXN7EeJqh6WKvqgA3of0fPYSR
	ihe/dPFp8PWEWjV5kOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvM7Z-00AfTV-2k;
	Tue, 24 Oct 2023 18:27:17 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvM7V-00AfRz-37;
	Tue, 24 Oct 2023 18:27:15 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1eb7a8d9610so271026fac.0;
        Tue, 24 Oct 2023 11:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698172030; x=1698776830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB5g9jVTVNd81eeii8uxLo5X0yRuiVq8WyebZu9f0ok=;
        b=a7pGF5qbTJ28LvJcxhsjU8lVl8hkYvIsUMZFbVuCueGnVx3TtcC9tnCxhiQ9AU82Ij
         mYxE9X9BefoRh3CwUZdnutU0cFVxzjH/BN9dn9BHXg/Q3Xr8Hz2L9ldKOHAb9lkaRpH7
         f3o4WO3NO4fJzIYsEObw0C8geEgEs9jxz0AIkU6n3fsmrQg+D1zGPWWgBEwItg9Pnd3Q
         9nGiWF0L7+MnU2hLwRrxZGemjjKS9+u7pt5JSO+JAY7EZFhV5LpH1qytHnMPyyQqBZhM
         wa5cyFnbV0QYfa0pAJs1IR4lnFFUSS/xfKhtjdwTSGBDfFYuROBlVrDsYSV11R2uprn8
         yN+g==
X-Gm-Message-State: AOJu0YzTWHYGpaIVnILveUE+B7R2ABTrSk3nQLtqE94J2Cp8N9Jkz5L0
	KyukEFnjMpcFvO31O6p2bGLvY/896+Zvp9TQqlw=
X-Google-Smtp-Source: AGHT+IHYw04Ty/CGd2NctaMoui4YrLNgBZQzIhNXmipd8DpS8HZWntl33os4cOY1dCw/clSDDFMROR1KkS5avBsdGCU=
X-Received: by 2002:a05:6870:cb81:b0:1d6:4c63:7ba9 with SMTP id
 ov1-20020a056870cb8100b001d64c637ba9mr17269512oab.3.1698172030159; Tue, 24
 Oct 2023 11:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 Oct 2023 20:26:58 +0200
Message-ID: <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/39] ACPI/arm64: add support for virtual cpuhotplug
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_112714_022883_49905466 
X-CRM114-Status: GOOD (  34.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgNToxNeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEhpLAo+Cj4gSSdtIHBvc3RpbmcgSmFt
ZXMnIHBhdGNoIHNldCB1cGRhdGVkIHdpdGggbW9zdCBvZiB0aGUgcmV2aWV3IGNvbW1lbnRzCj4g
ZnJvbSBoaXMgUkZDIHYyIHNlcmllcyBiYWNrIGluIFNlcHRlbWJlci4gSW5kaXZpZHVhbCBwYXRj
aGVzIGhhdmUgYQo+IGNoYW5nZWxvZyBhdHRhY2hlZCBhdCB0aGUgYm90dG9tIG9mIHRoZSBjb21t
aXQgbWVzc2FnZS4gVGhvc2Ugd2hpY2gKPiBJIGhhdmUgZmluaXNoZWQgdXBkYXRpbmcgaGF2ZSBt
eSBTLW8tYiBvbiB0aGVtLCB0aG9zZSB3aGljaCBzdGlsbCBoYXZlCj4gb3V0c3RhbmRpbmcgcmV2
aWV3IGNvbW1lbnRzIGZyb20gUkZDIHYyIGRvIG5vdC4gSW4gc29tZSBvZiB0aGVzZSBjYXNlcwo+
IEkndmUgYXNrZWQgcXVlc3Rpb25zIGFuZCBhbSB3YWl0aW5nIGZvciByZXNwb25zZXMuCj4KPiBJ
J20gcG9zdGluZyB0aGlzIGFzIFJGQyB2MyBiZWNhdXNlIHRoZXJlJ3Mgc3RpbGwgc29tZSB1bmFk
ZHJlc3NlZAo+IGNvbW1lbnRzIGFuZCBpdCdzIGNsZWFybHkgbm90IHJlYWR5IGZvciBtZXJnaW5n
LiBFdmVuIGlmIGl0IHdhcyByZWFkeQo+IHRvIGJlIG1lcmdlZCwgaXQgaXMgdG9vIGxhdGUgaW4g
dGhpcyBkZXZlbG9wbWVudCBjeWNsZSB0byBiZSB0YWtpbmcKPiB0aGlzIGNoYW5nZSBpbiwgc28g
dGhlcmUgd291bGQgYmUgbGl0dGxlIHBvaW50IHBvc3RpbmcgaXQgbm9uLVJGQy4KPiBBbHNvIEph
bWVzIHN0YXRlZCB0aGF0IGhlJ3Mgd2FpdGluZyBmb3IgY29uZmlybWF0aW9uIGZyb20gdGhlCj4g
S3ViZXJuZXRlcy9LYXRhIGZvbGsgLSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZSBzdGF0dXMgaXMg
dGhlcmUuCj4KPiBJIHdpbGwgYmUgc2VuZGluZyBlYWNoIHBhdGNoIGluZGl2aWR1YWxseSB0byBh
IHdpZGVyIGF1ZGllbmNlCj4gYXBwcm9wcmlhdGUgZm9yIHRoYXQgcGF0Y2ggLSBhcG9sb2dpZXMg
dG8gdGhvc2UgbWlzc2luZyBvdXQgb24gdGhpcwo+IGNvdmVyIG1lc3NhZ2UuIEkgaGF2ZSBhZGRl
ZCBtb3JlIG1haWxpbmcgbGlzdHMgdG8gdGhlIHNlcmllcyB3aXRoIHRoZQo+IGV4Y2VwdGlvbiBv
ZiB0aGUgYWNwaWNhIGxpc3QgaW4gYSBob3BlIG9mIHRoaXMgY292ZXIgbWVzc2FnZSBhbHNvCj4g
cmVhY2hpbmcgdGhvc2UgZm9say4KPgo+IFRoZSBjaGFuZ2VzIHRoYXQgYXJlbid0IGluY2x1ZGVk
IGFyZToKPgo+IDEuIFVwZGF0ZXMgZm9yIG15IHBhdGNoIHRoYXQgd2FzIG1lcmdlZCB2aWEgVGhv
bWFzICh0aGFua3MhKToKPiAgICBjNGRkODU0Zjc0MGMgY3B1LWhvdHBsdWc6IFByb3ZpZGUgcHJv
dG90eXBlcyBmb3IgYXJjaCBDUFUgcmVnaXN0cmF0aW9uCj4gICAgcmF0aGVyIHRoYW4gaGF2aW5n
IHRoaXMgY2hhbmdlIHNwcmVhZCB0aHJvdWdoIEphbWVzJyBwYXRjaGVzLgo+Cj4gMi4gTmV3IHBh
dGNoIC0gc2ltcGxpZmljYXRpb24gb2YgUEEtUklTQydzIHNtcF9wcmVwYXJlX2Jvb3RfY3B1KCkK
Pgo+IDMuIE1vdmVkICJBQ1BJOiBVc2UgdGhlIGFjcGlfZGV2aWNlX2lzX3ByZXNlbnQoKSBoZWxw
ZXIgaW4gbW9yZSBwbGFjZXMiCj4gICAgYW5kICJBQ1BJOiBSZW5hbWUgYWNwaV9zY2FuX2Rldmlj
ZV9ub3RfcHJlc2VudCgpIHRvIGJlIGFib3V0Cj4gICAgZW51bWVyYXRpb24iIHRvIHRoZSBiZWdp
bm5pbmcgb2YgdGhlIHNlcmllcyAtIHRoZXNlIHR3byBwYXRjaGVzIGFyZQo+ICAgIGFscmVhZHkg
cXVldWVkIHVwIGZvciBtZXJnaW5nIGludG8gNi43Lgo+Cj4gNC4gTW92ZWQgImFybTY0LCBpcnFj
aGlwL2dpYy12MywgQUNQSTogTW92ZSBNQURUIEdJQ0MgZW5hYmxlZCBjaGVjayBpbnRvCj4gICAg
YSBoZWxwZXIiIHRvIHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlcmllcywgd2hpY2ggaGFzIGJlZW4g
c3VibWl0dGVkLAo+ICAgIGJ1dCBhcyB5ZXQgdGhlIGZhdGUgb2YgdGhhdCBwb3N0aW5nIGlzbid0
IGtub3duLgo+Cj4gVGhlIGZpcnN0IGZvdXIgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBhcmUgcHJv
dmlkZWQgZm9yIGNvbXBsZXRuZXNzIG9ubHkuCj4KPiBUaGVyZSBpcyBhbiBhZGRpdGlvbmFsIHBh
dGNoIGluIEphbWVzJyBnaXQgdHJlZSB0aGF0IGlzbid0IGluIHRoZSBzZXQKPiBvZiBwYXRjaGVz
IHRoYXQgSmFtZXMgcG9zdGVkOiAiQUNQSTogcHJvY2Vzc29yOiBPbmx5IGNhbGwKPiBhcmNoX3Vu
cmVnaXN0ZXJfY3B1KCkgaWYgSE9UUExVR19DUFUgaXMgc2VsZWN0ZWQiIHdoaWNoIGxvb2tzIHRv
IG1lIHRvCj4gYmUgYSB3b3JrYXJvdW5kIGZvciBhcmNoX3VucmVnaXN0ZXJfY3B1KCkgYmVpbmcg
dW5kZXIgdGhlIGlmZGVmLiBJJ3ZlCj4gY29tbWVudGVkIG9uIHRoaXMgb24gdGhlIFJGQyB2MiBw
b3N0aW5nIG1ha2luZyBhIHN1Z2dlc3Rpb24sIGJ1dCBhcyB5ZXQKPiBoYXZlbid0IGhhZCBhbnkg
cmVzcG9uc2UuCj4KPiBJJ3ZlIGluY2x1ZGVkIGFsbW9zdCBhbGwgb2YgSmFtZXMnIG9yaWdpbmFs
IGNvdmVyaW5nIGJvZHkgYmVsb3cgdGhlCj4gZGlmZnN0YXQuCj4KPiBUaGUgcmVhc29uIHRoYXQg
SSdtIGRvaW5nIHRoaXMgaXMgdG8gaGVscCBtb3ZlIHRoaXMgY29kZSBmb3J3YXJkIHNvCj4gaG9w
ZWZ1bGx5IGl0IGNhbiBiZSBtZXJnZWQgLSB3aGljaCBpcyB3aHkgSSBoYXZlIGJlZW4ga2VlbiB0
byBkaWcgb3V0Cj4gZnJvbSBKYW1lcycgcGF0Y2hlcyBhbnl0aGluZyB0aGF0IGNhbiBiZSBtZXJn
ZWQgYW5kIHN1Ym1pdCBpdAo+IHNlcGFyYXRlbHksIHNpbmNlIHRoaXMgaXMgYSBmZWF0dXJlIGZv
ciB3aGljaCBzb21lIHVzZXJzIGhhdmUgYQo+IGRlZmluaXRlIG5lZWQgZm9yLgoKSSd2ZSBnb25l
IHRocm91Z2ggdGhlIHNlcmllcyBhbmQgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIHRoaW5nIGluIGl0
CnRoYXQgY29uY2VybnMgbWUgYSBsb3QgYW5kIHNvbWUgb3RoZXJzIHRoYXQgYXQgbGVhc3QgYXBw
ZWFyIHRvIGJlCnJlYWxseSBxdWVzdGlvbmFibGUuCgpJIG5lZWQgbW9yZSB0aW1lIHRvIHNlbmQg
Y29tbWVudHMgd2hpY2ggSSdtIG5vdCBnb2luZyB0byBkbyBiZWZvcmUgdGhlCjYuNyBtZXJnZSB3
aW5kb3cgKHNvcnJ5KSwgYnV0IGZyb20gd2hhdCBJIGNhbiBzYXkgcmlnaHQgbm93LCB0aGlzIGlz
Cm5vdCBsb29raW5nIGdvb2QuCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
