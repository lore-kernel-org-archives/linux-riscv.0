Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDEAC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmjj1mTGd3cVFP1Wvk0uksKKysF4hrrtgJMwJzO+LC0=; b=KF6zvBETneDFAw
	w/tUzGZxzXsJ+/XFenQ8uRDjf3mEVOKAOMyWrinpmA88AP1aNBJ7SikWoEmNgPiCX/cOmnbh58OY9
	Zsai+839JziRFgBgA2+80eDJ9D6XNO9HYKXNjU/gZQub0W0yaBjVHc2pAr2BaDuW8GoDb31KBR1kl
	2Fik1ZZGY+EZpBpVF1YH7HKigzcUcVNz6B3YOOd2fBdTcnpjnKgHNLZFVkDiOtXP9lNTWdXpXENHK
	rVPEddYimgMeoUvilKaJpNffKYy7iDXsvpySHBd8APXTh0+JunSNwdfx1LUgZ0tJgJKSdOwg/3uwK
	jsr7YLhYPb6u73lyJqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFK3l-00BzK3-2A;
	Mon, 18 Dec 2023 20:17:53 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFK3h-00BzIv-0i;
	Mon, 18 Dec 2023 20:17:51 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-20394042a45so279476fac.0;
        Mon, 18 Dec 2023 12:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702930666; x=1703535466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVggm/k7h51uGokCDrYG9yM8ij6+ByTlCjSSiz9AMHU=;
        b=s56z25n4i+dk4xaqeHL4n5LGzujmhBsu/wyx/1Uc6pHeBF+iXLCWeoK07ZaADhayDD
         i/WkKihM3BeMjCJFqPpYM+IsniMJbtIey0LEbYpJYJQwV6OB1GOmY6bNjk6Q/gAGp75i
         XpN2KuiS2cwg3bpyoojNQPNpm7KCgmwcm4aOhYTqUpB8evZecgOJIts6NDefTWFWylbS
         e7StFOhoNl6xrV6HZp5WLXj0/q88pjCKONbrV70dyDyUlGe2hWsWfhOPowIwYyfiGLxT
         qsv6Ec73QT/jBF1/bEVApC9mf4AfNjkwGzziWHcpoZy2l/xqy1RrsNy/yUdgorJJHEbd
         KHyA==
X-Gm-Message-State: AOJu0YxyXS9qw0aebZSfv80VDiEh+mdcLsTjSCek0zbUGX2KBJTbFDsx
	WtmF4KiPH/W0ff+9+5F04RJIYeTyGjuh1ZhmqLzNQbrQIxI=
X-Google-Smtp-Source: AGHT+IFMjefUSNquEpPstcFy8KIyactI5mxHoAdfHlD4qq0J99AZZDv3tX1Y2M6bLJ1U3Iv5VjAbiMgTsk/u/KcBObU=
X-Received: by 2002:a05:6870:9591:b0:203:e5bc:154a with SMTP id
 k17-20020a056870959100b00203e5bc154amr834085oao.2.1702930665760; Mon, 18 Dec
 2023 12:17:45 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Dec 2023 21:17:34 +0100
Message-ID: <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
To: Russell King <rmk+kernel@armlinux.org.uk>
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
X-CRM114-CacheID: sfid-20231218_121749_287838_7C81D797 
X-CRM114-Status: GOOD (  34.22  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBBQ1BJIGhhcyB0d28gd2F5cyBvZiBkZXNjcmliaW5nIHByb2Nlc3Nv
cnMgaW4gdGhlIERTRFQuIEZyb20gQUNQSSB2Ni41LAo+IDUuMi4xMjoKPgo+ICJTdGFydGluZyB3
aXRoIEFDUEkgU3BlY2lmaWNhdGlvbiA2LjMsIHRoZSB1c2Ugb2YgdGhlIFByb2Nlc3NvcigpIG9i
amVjdAo+IHdhcyBkZXByZWNhdGVkLiBPbmx5IGxlZ2FjeSBzeXN0ZW1zIHNob3VsZCBjb250aW51
ZSB3aXRoIHRoaXMgdXNhZ2UuIE9uCj4gdGhlIEl0YW5pdW0gYXJjaGl0ZWN0dXJlIG9ubHksIGEg
X1VJRCBpcyBwcm92aWRlZCBmb3IgdGhlIFByb2Nlc3NvcigpCj4gdGhhdCBpcyBhIHN0cmluZyBv
YmplY3QuIFRoaXMgdXNhZ2Ugb2YgX1VJRCBpcyBhbHNvIGRlcHJlY2F0ZWQgc2luY2UgaXQKPiBj
YW4gcHJlY2x1ZGUgYW4gT1NQTSBmcm9tIGJlaW5nIGFibGUgdG8gbWF0Y2ggYSBwcm9jZXNzb3Ig
dG8gYQo+IG5vbi1lbnVtZXJhYmxlIGRldmljZSwgc3VjaCBhcyB0aG9zZSBkZWZpbmVkIGluIHRo
ZSBNQURULiBGcm9tIEFDUEkKPiBTcGVjaWZpY2F0aW9uIDYuMyBvbndhcmQsIGFsbCBwcm9jZXNz
b3Igb2JqZWN0cyBmb3IgYWxsIGFyY2hpdGVjdHVyZXMKPiBleGNlcHQgSXRhbml1bSBtdXN0IG5v
dyB1c2UgRGV2aWNlKCkgb2JqZWN0cyB3aXRoIGFuIF9ISUQgb2YgQUNQSTAwMDcsCj4gYW5kIHVz
ZSBvbmx5IGludGVnZXIgX1VJRCB2YWx1ZXMuIgo+Cj4gQWxzbyBzZWUgaHR0cHM6Ly91ZWZpLm9y
Zy9zcGVjcy9BQ1BJLzYuNS8wOF9Qcm9jZXNzb3JfQ29uZmlndXJhdGlvbl9hbmRfQ29udHJvbC5o
dG1sI2RlY2xhcmluZy1wcm9jZXNzb3JzCj4KPiBEdXBsaWNhdGUgZGVzY3JpcHRpb25zIGFyZSBu
b3QgYWxsb3dlZCwgdGhlIEFDUEkgcHJvY2Vzc29yIGRyaXZlciBhbHJlYWR5Cj4gcGFyc2VzIHRo
ZSBVSUQgZnJvbSBib3RoIGRldmljZXMgYW5kIGNvbnRhaW5lcnMuIGFjcGlfcHJvY2Vzc29yX2dl
dF9pbmZvKCkKPiByZXR1cm5zIGFuIGVycm9yIGlmIHRoZSBVSUQgZXhpc3RzIHR3aWNlIGluIHRo
ZSBEU0RULgoKSSdtIG5vdCByZWFsbHkgc3VyZSBob3cgdGhlIGFib3ZlIGlzIHJlbGF0ZWQgdG8g
dGhlIGFjdHVhbCBwYXRjaC4KCj4gVGhlIG1pc3NpbmcgcHJvYmUgZm9yIENQVXMgZGVzY3JpYmVk
IGFzIHBhY2thZ2VzCgpJdCBpcyB1bmNsZWFyIHdoYXQgZXhhY3RseSBpcyBtZWFudCBieSAiQ1BV
cyBkZXNjcmliZWQgYXMgcGFja2FnZXMiLgoKRnJvbSB0aGUgcGF0Y2gsIGl0IGxvb2tzIGxpa2Ug
dGhvc2Ugd291bGQgYmUgUHJvY2Vzc29yKCkgb2JqZWN0cwpkZWZpbmVkIHVuZGVyIGEgcHJvY2Vz
c29yIGNvbnRhaW5lciBkZXZpY2UuCgo+IGNyZWF0ZXMgYSBwcm9ibGVtIGZvcgo+IG1vdmluZyB0
aGUgY3B1X3JlZ2lzdGVyKCkgY2FsbHMgaW50byB0aGUgYWNwaV9wcm9jZXNzb3IgZHJpdmVyLCBh
cyBDUFVzCj4gZGVzY3JpYmVkIGxpa2UgdGhpcyBkb24ndCBnZXQgcmVnaXN0ZXJlZCwgbGVhZGlu
ZyB0byBlcnJvcnMgZnJvbSBvdGhlcgo+IHN1YnN5c3RlbXMgd2hlbiB0aGV5IHRyeSB0byBhZGQg
bmV3IHN5c2ZzIGVudHJpZXMgdG8gdGhlIENQVSBub2RlLgo+IChlLmcuIHRvcG9sb2d5X3N5c2Zz
X2luaXQoKSdzIHVzZSBvZiB0b3BvbG9neV9hZGRfZGV2KCkgdmlhIGNwdWhwKQo+Cj4gVG8gZml4
IHRoaXMsIHBhcnNlIHRoZSBwcm9jZXNzb3IgY29udGFpbmVyIGFuZCBjYWxsIGFjcGlfcHJvY2Vz
c29yX2FkZCgpCj4gZm9yIGVhY2ggcHJvY2Vzc29yIHRoYXQgaXMgZGlzY292ZXJlZCBsaWtlIHRo
aXMuCgpEaXNjb3ZlcmVkIGxpa2Ugd2hhdD8KCj4gVGhlIHByb2Nlc3NvciBjb250YWluZXIKPiBo
YW5kbGVyIGlzIGFkZGVkIHdpdGggYWNwaV9zY2FuX2FkZF9oYW5kbGVyKCksIHNvIG5vIGRldGFj
aCBjYWxsIHdpbGwKPiBhcnJpdmUuCgpUaGUgYWJvdmUgcmVxdWlyZXMgY2xhcmlmaWNhdGlvbiB0
b28uCgo+IFFlbXUgVENHIGRlc2NyaWJlcyBDUFVzIHVzaW5nIHByb2Nlc3NvciBkZXZpY2VzIGlu
IGEgcHJvY2Vzc29yIGNvbnRhaW5lci4KPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlIGJ1aWxk
X2NwdXNfYW1sKCkgaW4gUWVtdSBody9hY3BpL2NwdS5jIGFuZAo+IGh0dHBzOi8vdWVmaS5vcmcv
c3BlY3MvQUNQSS82LjUvMDhfUHJvY2Vzc29yX0NvbmZpZ3VyYXRpb25fYW5kX0NvbnRyb2wuaHRt
bCNwcm9jZXNzb3ItY29udGFpbmVyLWRldmljZQo+Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgTW9y
c2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4gVGVzdGVkLWJ5OiBNaWd1ZWwgTHVpcyA8bWlndWVs
Lmx1aXNAb3JhY2xlLmNvbT4KPiBUZXN0ZWQtYnk6IFZpc2hudSBQYWpqdXJpIDx2aXNobnVAb3Mu
YW1wZXJlY29tcHV0aW5nLmNvbT4KPiBUZXN0ZWQtYnk6IEppYW55b25nIFd1IDxqaWFueW9uZy53
dUBhcm0uY29tPgo+IC0tLQo+IE91dHN0YW5kaW5nIGNvbW1lbnRzOgo+ICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjMwOTE0MTQ1MzUzLjAwMDA3MmUyQEh1YXdlaS5jb20KPiAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci81MDU3MWMyZi1hYTNjLWJhZWItM2FkZC1jZDU5ZTBlZGRjMDJA
cmVkaGF0LmNvbQo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYyB8IDIyICsr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYyBiL2RyaXZlcnMv
YWNwaS9hY3BpX3Byb2Nlc3Nvci5jCj4gaW5kZXggNGZlMmVmNTQwODhjLi42YTU0MmUwY2UzOTYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiArKysgYi9kcml2
ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+IEBAIC02MjYsOSArNjI2LDMxIEBAIHN0YXRpYyBz
dHJ1Y3QgYWNwaV9zY2FuX2hhbmRsZXIgcHJvY2Vzc29yX2hhbmRsZXIgPSB7Cj4gICAgICAgICB9
LAo+ICB9Owo+Cj4gK3N0YXRpYyBhY3BpX3N0YXR1cyBhY3BpX3Byb2Nlc3Nvcl9jb250YWluZXJf
d2FsayhhY3BpX2hhbmRsZSBoYW5kbGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHUzMiBsdmwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmNvbnRleHQsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKipydikKPiArewo+ICsgICAgICAg
c3RydWN0IGFjcGlfZGV2aWNlICphZGV2Owo+ICsgICAgICAgYWNwaV9zdGF0dXMgc3RhdHVzOwo+
ICsKPiArICAgICAgIGFkZXYgPSBhY3BpX2dldF9hY3BpX2RldihoYW5kbGUpOwo+ICsgICAgICAg
aWYgKCFhZGV2KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gQUVfRVJST1I7CgpXaHkgaXMgdGhl
IHJlZmVyZW5jZSBjb3VudGluZyBuZWVkZWQgaGVyZT8KCldvdWxkbid0IGFjcGlfZmV0Y2hfYWNw
aV9kZXYoKSBzdWZmaWNlPwoKQWxzbywgc2hvdWxkIHRoZSB3YWxrIHJlYWxseSBiZSB0ZXJtaW5h
dGVkIG9uIHRoZSBmaXJzdCBlcnJvcj8KCj4gKwo+ICsgICAgICAgc3RhdHVzID0gYWNwaV9wcm9j
ZXNzb3JfYWRkKGFkZXYsICZwcm9jZXNzb3JfZGV2aWNlX2lkc1swXSk7Cj4gKyAgICAgICBhY3Bp
X3B1dF9hY3BpX2RldihhZGV2KTsKPiArCj4gKyAgICAgICByZXR1cm4gc3RhdHVzOwo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW50IGFjcGlfcHJvY2Vzc29yX2NvbnRhaW5lcl9hdHRhY2goc3RydWN0IGFj
cGlfZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCAqaWQpCj4gIHsKPiArICAgICAgIGFjcGlf
d2Fsa19uYW1lc3BhY2UoQUNQSV9UWVBFX1BST0NFU1NPUiwgZGV2LT5oYW5kbGUsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEFDUElfVUlOVDMyX01BWCwgYWNwaV9wcm9jZXNzb3JfY29u
dGFpbmVyX3dhbGssCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwsIE5V
TEwpOwoKVGhpcyBjb3ZlcnMgcHJvY2Vzc29yIG9iamVjdHMgb25seSwgc28gd2h5IGlzIHRoaXMg
bm90IG5lZWRlZCBmb3IKcHJvY2Vzc29yIGRldmljZXMgZGVmaW5lZCB1bmRlciBhIHByb2Nlc3Nv
ciBjb250YWluZXIgb2JqZWN0PwoKSXQgaXMgbm90IG9idmlvdXMsIHNvIGl0IHdvdWxkIGJlIG5p
Y2UgdG8gYWRkIGEgY29tbWVudCBleHBsYWluaW5nIHRoZQpkaWZmZXJlbmNlLgoKPiArCj4gICAg
ICAgICByZXR1cm4gMTsKPiAgfQo+Cj4gLS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
