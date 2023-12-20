Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A86C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwVO8PCHxq1lk1uZsz6u5Kj/H/FCC3b7IKWd0lW+PrQ=; b=oEZ8hLi0VCOPoo
	NgyqsPLfKPNn0yr2+DV+3pySA6O9vgwJcFLgQZKJhzDrFgFJG1ucIAREZUOBjSMRn7ngwRY8CimFZ
	a6bqCAyoWixGhE0dFU09l3TJousNf0WdvtVgP+LWsav/oJfsAHW2G8dPCgfW194cQ2tMAPmVPCWB2
	dRZdV3IwmXBkF5UU+Amf7jWPMXaQ3Z76xNOEGpnOpGOcKW0MN9rU6Dkiaws7s86Ur3am9Z12iyY5I
	9VcR6BsjKBxh9SSqcdqCMenJsevmh5kFxC3baPw+YnZuENof7kwrexWM1X7StlIDkZeV7WlPNcdUW
	LLDfgMzGati3nRyE4nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFzAw-000PEt-0l;
	Wed, 20 Dec 2023 16:12:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFzAs-000PCp-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:11:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50e59505881so104302e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088715; x=1703693515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGx3mvOX20FMBsOoq/Rtz9Ujh/ImS9qvHUsXKwO1l94=;
        b=BWefiaHOQXnC1ehEWZAH2uww4cDSITcO0xE3FfZe5lvnsOQeRhsWpC2IucbHyd+zh9
         IBhOOJRAEc2FNTLPQPZ/QeQ0nOoFYj6QdIc72f5K6vtLNpH5IB3MoYAlYo0bItwrNWKp
         c0qkqx5urx+uAE6yE0hr/zMKE96VWhernpw7bXpCqYpmRNNihdpJknV8JeymWgxkn78Q
         vnhornDEynvH4WzSI4qUc/HeuxYk4soY3gadq4DFuikBa/jYxsW1l7X44IqmCqd48M/i
         jstVQMkAXTHtOxM/edkIQqvEUTO8kBjpf46q/FfwJlQXC+vqK+hLAULT+FzL2wSF8gSj
         sSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088715; x=1703693515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGx3mvOX20FMBsOoq/Rtz9Ujh/ImS9qvHUsXKwO1l94=;
        b=WSFriaB1COnEgDblpdOuAVu4wGh4RpD8tRoc9mDMEYTE3P5aOMEM9nT9H1uUANPfv6
         wCyMZv6E+VVJ2IwzHfHkREa9OqHfT+CmnLzUNxhvOT/paWFWwyIloZGChr0UFM3sP0r+
         PLbRhF2U9zc5NLpKkfhhc/BOiVQr5hM89ryndhSgXQbrEMlds2koZgbGVDEfS5B0/Nbw
         FLS3YvuWABQbYyC2YM3iUlb4ED3nruFnrTWY3g2bHaF4RnLJtmnmmT7pVdvabHLkcFXj
         lrkQHAQH98WH9Q+majrG8YYsKHgaXTKX7i8HsJMVEP/cKYl2OH90HmVvc2JflX7MnaLO
         TAfA==
X-Gm-Message-State: AOJu0YwivfcM30J/nZicIt6L9zulHNFPyLHXuDiMtEh2fMQcVY0Aesvy
	rmAJCere9cJV3tSh7twHl5DoeV72+wtdKZIB/xdH+Q==
X-Google-Smtp-Source: AGHT+IHTIBxn/hAWuX2YpEeUprzxay2hcYxN4T2+QPQhdmFxKBZSfCel3BGt1XgcPLx+r4rAxV26oNPcsoEoxPZnobw=
X-Received: by 2002:a05:6512:3e1a:b0:50e:4ffa:589e with SMTP id
 i26-20020a0565123e1a00b0050e4ffa589emr895516lfv.42.1703088715341; Wed, 20 Dec
 2023 08:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20231220160012.40184-15-ajones@ventanamicro.com>
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Dec 2023 21:41:43 +0530
Message-ID: <CAK9=C2Vzp=P6Cg-WEDZGCAsKW01fkNWbozGqNn0fYAA7qCbOYA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] RISC-V: Add steal-time support
To: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	atishp@atishpatra.org, pbonzini@redhat.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_081158_169198_3AACCC5D 
X-CRM114-Status: GOOD (  25.09  )
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

SGkgUGFsbWVyLAoKT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgOTozMOKAr1BNIEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT25lIGZyZXF1ZW50bHkgdG91
dGVkIGJlbmVmaXQgb2YgdmlydHVhbGl6YXRpb24gaXMgdGhlIGFiaWxpdHkgdG8KPiBjb25zb2xp
ZGF0ZSBtYWNoaW5lcywgaW5jcmVhc2luZyByZXNvdXJjZSB1dGlsaXphdGlvbi4gIEl0IG1heSBl
dmVuIGJlCj4gZGVzaXJhYmxlIHRvIG92ZXJjb21taXQsIGF0IHRoZSByaXNrIG9mIG9uZSBvciBt
b3JlIFZDUFVzIGhhdmluZyB0byB3YWl0Lgo+IEh5cGVydmlzb3JzIHdoaWNoIGhhdmUgaW50ZXJm
YWNlcyBmb3IgZ3Vlc3RzIHRvIHJldHJpZXZlIHRoZSBhbW91bnQgb2YKPiB0aW1lIGVhY2ggVkNQ
VSBoYWQgdG8gd2FpdCBnaXZlIG9ic2VydmVycyB3aXRoaW4gdGhlIGd1ZXN0cyB3YXlzIHRvCj4g
YWNjb3VudCBmb3IgbGVzcyBwcm9ncmVzcyB0aGFuIHdvdWxkIG90aGVyd2lzZSBiZSBleHBlY3Rl
ZC4gVGhlIFNCSSBTVEEKPiBleHRlbnNpb25bMV0gcHJvdmlkZXMgYSBzdGFuZGFyZCBpbnRlcmZh
Y2UgZm9yIGd1ZXN0IFZDUFVzIHRvIHJldHJpZXZlCj4gdGhlIGFtb3VudCBvZiB0aW1lICJzdG9s
ZW4iLgo+Cj4gVGhpcyBzZXJpZXMgaGFzIHRocmVlIHBhcnRzOgo+ICAxKSBQYXRjaGVzIDAxLTAz
IC0gQWRkIHBhcmF2aXJ0IHN1cHBvcnQgdG8gUklTQy1WIGFuZCBpbXBsZW1lbnQKPiAgICAgICAg
ICAgICAgICAgICAgIHN0ZWFsLXRpbWUgYWNjb3VudGluZyBzdXBwb3J0IHVzaW5nIHRoZSBTQkkg
U1RBCj4gICAgICAgICAgICAgICAgICAgICBleHRlbnNpb24uCj4gIDIpIFBhdGNoZXMgMDQtMDkg
LSBJbXBsZW1lbnQgU0JJIFNUQSBpbiBLVk0gc28gS1ZNIGd1ZXN0cywgc3VjaCBhcwo+ICAgICAg
ICAgICAgICAgICAgICAgTGludXggZ3Vlc3RzIHdoaWNoIGVuYWJsZSB0aGUgcGFyYXZpcnQgc3Rl
YWwtdGltZQo+ICAgICAgICAgICAgICAgICAgICAgc3VwcG9ydCwgY2FuIGJlIGVubGlnaHRlbmVk
IGFib3V0IHN0b2xlbiB0aW1lLgo+ICAzKSBQYXRjaGVzIDEwLTEzIC0gQWRkIFJJU0MtViBzdXBw
b3J0IHRvIHRoZSBLVk0gc2VsZnRlc3RzIHN0ZWFsX3RpbWUKPiAgICAgICAgICAgICAgICAgICAg
IHRlc3QgYW5kIHRoZSBTQkkgZXh0ZW5zaW9uIHJlZ3MgaW4gdGhlIGdldC1yZWctbGlzdAo+ICAg
ICAgICAgICAgICAgICAgICAgdGVzdC4KPgo+IFRoZXNlIHBhdGNoZXMgYXJlIGJhc2VkIG9uIGt2
bS1yaXNjdi9yaXNjdl9rdm1fcXVldWUKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
bm9uLWlzYS9yaXNjdi1zYmktZG9jL2Jsb2IvbWFzdGVyL3NyYy9leHQtc3RlYWwtdGltZS5hZG9j
Cj4KPiBUaGlzIHBhdGNoZXMgYXJlIGFsc28gYXZhaWxhYmxlIGhlcmUKPiBodHRwczovL2dpdGh1
Yi5jb20vam9uZXMtZHJldy9saW51eC9jb21taXRzL2t2bS9zdGVhbC10aW1lLXY0Cj4KPiBDaGFu
Z2VzIHNpbmNlIHYzOgo+ICAtIFVzZSB3b3JrICJDb21wdXRpbmciIGluc3RlYWQgb2YgInVzaW5n
IiBpbiBwcl9pbmZvIFtBdGlzaF0KPiAgLSBSZW5hbWUgS1ZNX1JFR19SSVNDVl9TQkkgdG8gS1ZN
X1JFR19SSVNDVl9TQklfU1RBVEUgW0F0aXNoLCBBbnVwXQo+ICAtIFBpY2tlZCB1cCByLWIncyBm
cm9tIEF0aXNoIGFuZCBBbnVwCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIEFsd2F5cyBjaGVj
ayBzZXF1ZW5jZSBpbiBjYXNlIHRoZSBTQkkgaW1wbCBpc24ndCB3cml0aW5nIHN0ZWFsCj4gICAg
YXRvbWljYWxseSBbQW51cF0KPiAgLSBDcmVhdGUgYSByZXNldCBmdW5jdGlvbiBmb3Igc3RhIGFu
ZCBhbHNvIHJlc2V0IGxhc3Rfc3RlYWwgW0FudXBdCj4gIC0gUGlja2VkIHVwIEFudXAncyByLWIn
cwo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBzYmlfc3RhX3N0ZWFsX3RpbWVfc2V0X3NobWVt
KCkgbm93IG1hcHMgU0JJIGVycm9ycyB0byBsaW51eCBlcnJvcnMgW0Nvbm9yXQo+ICAtIFNxdWFz
aGVkIHYxIHBhdGNoIDQgaW50byB2MSBwYXRjaCAzIFtDb25vcl0KPiAgLSBNb3ZlZCBrdm1fcmlz
Y3ZfdmNwdV9zZXQvZ2V0X3JlZ19zYmkoKSB0byBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4g
ICAgd2hpY2ggc2VlbXMgbGlrZSBhIG1vcmUgYXBwcm9wcmlhdGUgZmlsZSBmb3IgdGhlbQo+ICAt
IFJlYmFzZWQgb24ga3ZtLXJpc2N2L3Jpc2N2X2t2bV9xdWV1ZSB3aGljaCBoYXMgYWxsIHRoZSBk
ZXBlbmRlbmNpZXMKPgo+IENoYW5nZXMgc2luY2UgUkZDOgo+ICAtIFJlYmFzZWQgb24gdjYuNy1y
YzMgKHBsdXMgdGhlIHBhdGNoZXMgbWVudGlvbmVkIGFib3ZlKQo+ICAtIEFkZGVkIGRlZmluZXMg
Zm9yIHRoZSAtMSdzIFtDb25vcl0KPiAgLSBBZGRlZCBhIGNvbW1lbnQgdG8gdGhlIHN0ZWFsIHJl
YWQgc2VxdWVuY2UgW0Nvbm9yXQo+ICAtIE9ubHkgZG8gdGhlIHN0ZWFsIHJlYWQgc2VxdWVuY2Ug
Zm9yIDMyLWJpdCBhbmQgYWRkZWQgUkVBRF9PTkNFJ3MKPiAgLSBDaGVjayBmb3IgU0JJIHYyLjAg
aW1wbGVtZW50YXRpb24KPiAgLSBSZW5hbWUgc2V0X3N0ZWFsX3RpbWVfc2htZW0gdG8gc3RlYWxf
dGltZV9zZXRfc2htZW0KPiAgLSBBZGQgZ2V0LXJlZy1saXN0IHN1cHBvcnQgYW5kIHRlc3Qgd2l0
aCBnZXQtcmVnLWxpc3Qga3NlbGZ0ZXN0Cj4gIC0gQSBmZXcgb3RoZXIgbWlub3IgaW1wcm92ZW1l
bnRzCj4gIC0gUGlja2VkIHVwIG9uZSByLWIgZnJvbSBDb25vcgo+Cj4gVGhhbmtzLAo+IGRyZXcK
Pgo+Cj4gQW5kcmV3IEpvbmVzICgxMyk6Cj4gICBSSVNDLVY6IHBhcmF2aXJ0OiBBZGQgc2tlbGV0
b24gZm9yIHB2LXRpbWUgc3VwcG9ydAo+ICAgUklTQy1WOiBBZGQgU0JJIFNUQSBleHRlbnNpb24g
ZGVmaW5pdGlvbnMKPiAgIFJJU0MtVjogcGFyYXZpcnQ6IEltcGxlbWVudCBzdGVhbC10aW1lIHN1
cHBvcnQKPiAgIFJJU0MtVjogS1ZNOiBBZGQgU0JJIFNUQSBleHRlbnNpb24gc2tlbGV0b24KPiAg
IFJJU0MtVjogS1ZNOiBBZGQgc3RlYWwtdXBkYXRlIHZjcHUgcmVxdWVzdAo+ICAgUklTQy1WOiBL
Vk06IEFkZCBTQkkgU1RBIGluZm8gdG8gdmNwdV9hcmNoCj4gICBSSVNDLVY6IEtWTTogQWRkIHN1
cHBvcnQgZm9yIFNCSSBleHRlbnNpb24gcmVnaXN0ZXJzCj4gICBSSVNDLVY6IEtWTTogQWRkIHN1
cHBvcnQgZm9yIFNCSSBTVEEgcmVnaXN0ZXJzCj4gICBSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNC
SSBTVEEgZXh0ZW5zaW9uCj4gICBSSVNDLVY6IEtWTTogc2VsZnRlc3RzOiBNb3ZlIHNiaV9lY2Fs
bCB0byBwcm9jZXNzb3IuYwo+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czogQWRkIGd1ZXN0X3Ni
aV9wcm9iZV9leHRlbnNpb24KPiAgIFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IEFkZCBzdGVhbF90
aW1lIHRlc3Qgc3VwcG9ydAo+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czogQWRkIGdldC1yZWct
bGlzdCB0ZXN0IGZvciBTVEEgcmVnaXN0ZXJzCgpDYW4geW91IHBsZWFzZSByZXZpZXcgYW5kIGFj
ayB0aGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyA/CgpSZWdhcmRzLApBbnVwCgo+Cj4gIC4uLi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICAgNiArLQo+ICBhcmNoL3Jp
c2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTkgKysKPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICAgICAgICAgIHwgIDEwICsKPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICAgICAgIHwgIDEwICsKPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wYXJhdmlydC5oICAgICAgICAgICAgIHwgIDI4ICsrKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X2FwaV9jbG9jay5oICAgfCAgIDEgKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgICAgICAgICAgICAgfCAgMTcgKysKPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgIDEzICsrCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAgICAgICAgICB8IDEzNCArKysrKysr
KysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwo+ICBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDcgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCAg
NTEgKysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICAgICAgICAg
IHwgIDY3ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyAgICAgICAgICAg
ICAgICAgfCAyMDggKysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9NYWtlZmlsZSAgICAgICAgICB8ICAgNSArLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNs
dWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICAgfCAgMjIgKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vbGli
L3Jpc2N2L3Byb2Nlc3Nvci5jICAgICAgIHwgIDQ1ICsrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jIHwgIDI2IC0tLQo+ICAuLi4vc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgNDMgKysrKwo+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vc3RlYWxfdGltZS5jICAgICAgfCAgOTkgKysrKysrKysrCj4gIDIzIGZp
bGVzIGNoYW5nZWQsIDc4MiBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFyYXZpcnQuaAo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXJhdmlydF9hcGlfY2xvY2suaAo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYwo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPgo+IC0tCj4gMi40
My4wCj4KPgo+IC0tCj4ga3ZtLXJpc2N2IG1haWxpbmcgbGlzdAo+IGt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
