Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3BEC79FA9
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tu56OiCPc1caDXvnRemiE2KTt2xHCReBTk+/MlTodxw=; b=XIuYdP3kMtPL7B
	vCQqK9e7eIqCfvUZFkAaZQ5K9w6QS5ZLnDUr04/+tPOEvIPtUvluG3WiASauXOFxFlom7SmBGCThi
	SbPDjkb8+rl1yZVsFuo3arFezglQzvFVrh+o3XXUzq0rWt+3Rf2Qf4Up1azuVjL2FDBW8P7lRFM8A
	KUvfVxGL8UHXgFvmJophowmSfXX4D6O1EXrcy8GRMiAnFsUab5HCJqIhWhDjLK4b212du5zuzB+IU
	Xt+SUMxBiOScDtPniTwaRn4MOzpH1EiRMWaFaAkQ/k9nOnx4jqjui8ZuwzL9AFHeDMEj+lYQbpHdN
	g/A5gDVchn0F4qNZerTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WVk-00000006TUY-3kU5;
	Mon, 07 Sep 2026 10:23:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WVi-00000006TTx-1c5t
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 10:23:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48586861639so2479233f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 03:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776612; cv=none;
        d=google.com; s=arc-20260327;
        b=NwAwX2N9jk0wByz6aZHoCvr9lieCmO0OLFc+TlyVEX0qs5VyWZ10QZPLZaJous3oCL
         H1rIBk+lPLHNhCaxjiEM6NC0btRWDwU16uM53UWe4ykXPWir7ruZuuyeAghPQzqM+NzI
         4nS0wDiRo8YR3dQW/s1OMkC+umoJLqxbvBkVEbPaJOzBUHmzUMWgEDjyTjIviUgY5TqW
         Xf0M1N/QON3WX5AfQJauzhD6bplXJk/fGvHYlsNDTsM9966yiELL1Vd1Rd4wfKnkk6Wl
         /mnRuVDjuE9BijBO0BSmYTn7PWw2HkwnYcvy4A5q/K6FiRu71MaQteUo7xCC0sTx4n9K
         NhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99rrNQK9PYDQWtqeDcI+v8dFCF97V9GRd5/NAE170tM=;
        fh=cOHERzQytEjJWda+r6uTordghS88OD6sber32jX0nHQ=;
        b=KMuOACXiWiWmxTpoS+nP8OFz2Zsa6K49qUXCC/T2d+d8y4saF0hAZZbavXr/nudEw3
         yBmFreHugorIH9hYBFkg/YWQJvn7WxPmUqOjXkz/inqbM2KfrrgDdaE+EsD/NKPLaaDA
         9zUcmM4Y+rOUzmLCIaOkrE+l6DJuyPfB/oiakxuhj1lDDdDxyVyrIlz9gvD3oHihUhpE
         teHmE/37QFCCe7Sd9GrY/bByhgw12STqNHrX9O5tDZJPFp3sGS7q7Gvij7jC0QSxY95D
         HPtz0RvMjKUshBjmplcWGjYEFDb38DNJ97JZbt+6JkdwF+WjKuM09wYl6mQJmXHWNRBV
         vEEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776612; x=1789381412; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=99rrNQK9PYDQWtqeDcI+v8dFCF97V9GRd5/NAE170tM=;
        b=A6z8pHzOqPxJxLS00tgNO3ymqncPwO2+aT5eAEVlVV2VlQXk0bRF9Rv2CJtJZ77ZvR
         RYV7GD6a/GR7owAarIoQyw5z/frAZ1LgjiHawj2i1SKDMdVlmlvUjBD8ZZBsu6P0jw4r
         nTepkWQHZKcTAGpt4twyUtg874utAtg3lyptqB5StyMWWpE5vyA29zV+CXTjCMS0Kf9A
         SLa4BzqRaEcelYTK8HhpIKWo02kmWvOHXH9AJOSZ2wnCFy3QVMnTr/M7c20JB+WQlRUs
         MLVpNNIdVfyG+rXORMOn+4WW6tvw8fdbATNSD06PYLp+WrXziFXoYdiQocR1RVP4JfP3
         VAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776612; x=1789381412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99rrNQK9PYDQWtqeDcI+v8dFCF97V9GRd5/NAE170tM=;
        b=Jrv0oFUabMFIwrFBZJIRAj9f3I3Wu0wyZUvwi4HkC5R+etm2uBbSoFsDN/cD3rNwR0
         rtsav5RRjPXrdyZHrutb2ih1eQ0WapPZ7KohzDPMvQSxQqEd/26vj2exZIY/3vT5oy2H
         P/pX5vWrvOINXGaAdt8xt2y/ygj1RzAFQNR6OY+WxE2REVHFYKLXgGwAS49n2Pbqm7DF
         sO/MdLw/4qfUVlwZrfh5ErxBY2HyJuTf/SPvdj0MOimTHP72Bz+rimNRMEp51Y4YlioQ
         kke8sune3EKOnFqCoNzHWxoDlVuQwL3FDgLzbJIzBxTk+BlFF4vJIysPg2V/FUtYJWzY
         DqEw==
X-Forwarded-Encrypted: i=1; AKwUvBzUvGC3WdZ8Rk9jI3LqaIWZRUiBJ53FwFxP0mcBmJr8NkJndVV7ZCNzqCkxsNLhe+Z/2M5syO1AfFe/Pw==@lists.infradead.org
X-Gm-Message-State: AFuF++kMQKcYzBW1YqUBq/Div/3Jiy+0+lEwwbHQ5kf69nn2kQ/bhFSI
	4s33PzedMkFHQvJkoyAfDlmgkhg3DEAQ9p2EoIbwhtt/tEigwyLuRSNScEpZMBP1kCrWgaP62MO
	AaK6D33yDkFism6OdEpX3IV9WiaiypAiM5Vzb7TM=
X-Gm-Gg: AYBFou20X9tKNytcmzPg6+IA56K4U8gpMl25zEycSG7J2NhuZk6i3qisDi+VM3AgM6p
	Rwg48ZTG7DjzH0bjzPsYdIfyQJ8lhTHJMQdze+94M6wtnzU3d6+JkxLEzne42nAEqRZBVhoIeh2
	rIxYEEaHPHQesbHq+EI+VqQpamYtjDXZ01GZqKMwUYrVpSINN/fB44zYAzrdRgtf/DSbN88QdPC
	ZvAwXU2DeeBw8GeV7lYkmjtbyb97/9JEjGLCe3rm781rve3+xA2aDScNHvoAhgBBRfVpoTEkPE0
	4zCOfsv8vQWH0X0iwxWb7o0FcwqlRn3sAQiqHP9VUDnVfcjWAZgKWh7rWPYlZlRdJa/4lLQ4Vkr
	c8SU=
X-Received: by 2002:adf:edc8:0:b0:482:e658:7a39 with SMTP id
 ffacd0b85a97d-4857e5171femr24476358f8f.11.1788776611775; Mon, 07 Sep 2026
 03:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260905134251.67210-1-hppiscas@163.com> <apwrUYd3VybxbAm7@nickhuang>
 <wg57x6u3fomukerbnfbmmxywoljyrlqlctytfnqdlhl74jvigg@t3aygzlhtpui>
In-Reply-To: <wg57x6u3fomukerbnfbmmxywoljyrlqlctytfnqdlhl74jvigg@t3aygzlhtpui>
From: Nick Huang <sef1548@gmail.com>
Date: Mon, 7 Sep 2026 18:23:19 +0800
X-Gm-Features: AcwNN1Vp_cuM5nShreT_zeNzhbqLHFyRtdBlAeKSiWtpbuJ0qpc92MV9cu7-sFI
Message-ID: <CABZAGRFSqQh1AWF=bYO5xXQWDVHK+5NVgHt9=N8wcQY2ZuK4YQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>, Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yu Ning <ningyu@eswincomputing.com>, Yanghui Ou <ouyanghui@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_032334_481299_647705E6 
X-CRM114-Status: GOOD (  24.17  )
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

TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+IOaWvCAyMDI25bm0OeaciDXm
l6XpgLHlha0g5LiL5Y2IMTE6NTXlr6vpgZPvvJoKPgo+IE9uIFNhdCwgU2VwIDA1LCAyMDI2IGF0
IDAyOjQ2OjQxUE0gKzAwMDAsIE5pY2sgSHVhbmcgd3JvdGU6Cj4gPiBPbiBTYXQsIFNlcCAwNSwg
MjAyNiBhdCAwOTo0Mjo1MVBNICswODAwLCBocHAuaXNjYXMgd3JvdGU6Cj4gPiA+IFRoZSBFU1dJ
TiBQQ0llIGhvc3QgY29udHJvbGxlciBpcyBhIHBsYXRmb3JtIGRyaXZlciBtYXRjaGVkIHRocm91
Z2gKPiA+ID4gZXN3aW5fcGNpZV9vZl9tYXRjaC4gUENJRV9FU1dJTiBpcyB0cmlzdGF0ZSwgYnV0
IHRoZSB0YWJsZSBpcyBub3QKPiA+ID4gcHVibGlzaGVkIGZvciBPRiBtb2R1bGUgYXV0b2xvYWRp
bmcuCj4gPiA+Cj4gPiA+IFB1Ymxpc2ggdGhpcyBwbGF0Zm9ybS1kZXZpY2UgdGFibGUuIERvIG5v
dCBjaGFuZ2UgdGhlIFJJU0MtViBob3N0Cj4gPiA+IGluaXRpYWxpemF0aW9uIHNlcXVlbmNlIG9y
IFBDSSBkZXZpY2UgbWF0Y2hpbmcuCj4gPiA+Cj4gPiA+IEZpeGVzOiBiNTkzYzI2ZDA4MWEgKCJQ
Q0k6IGVzd2luOiBBZGQgRVNXSU4gUENJZSBSb290IENvbXBsZXggZHJpdmVyIikKPiA+ID4gU2ln
bmVkLW9mZi1ieTogaHBwLmlzY2FzIDxocHBpc2Nhc0AxNjMuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYyB8IDEgKwo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWVzd2luLmMgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWVzd2luLmMKPiA+ID4gaW5kZXggY2U4ZDY0Zi4uMWJiNDQ2OSAxMDA2NDQK
PiA+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1lc3dpbi5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYwo+ID4gPiBAQCAt
Mzg4LDYgKzM4OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGVzd2luX3Bj
aWVfb2ZfbWF0Y2hbXSA9IHsKPiA+ID4gICAgIHsgLmNvbXBhdGlibGUgPSAiZXN3aW4sZWljNzcw
MC1wY2llIiwgLmRhdGEgPSAmZXN3aW5fZWljNzcwMF9kYXRhIH0sCj4gPiA+ICAgICB7fQo+ID4g
PiAgfTsKPiA+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGVzd2luX3BjaWVfb2ZfbWF0Y2gp
Owo+ID4gPgo+ID4gPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZXN3aW5fcGNpZV9k
cml2ZXIgPSB7Cj4gPiA+ICAgICAucHJvYmUgPSBlc3dpbl9wY2llX3Byb2JlLAo+ID4gPgo+ID4g
SGkgaHBwLmlzY2FzCj4gPgo+ID4gU2luY2UgdGhpcyBkcml2ZXIgdXNlcyBgYnVpbHRpbl9wbGF0
Zm9ybV9kcml2ZXIoZXN3aW5fcGNpZV9kcml2ZXIpYCwgaXQKPiA+IGFwcGVhcnMgdG8gYmUgYnVp
bHQtaW4gb25seS4gSW4gdGhhdCBjYXNlLCBgTU9EVUxFX0RFVklDRV9UQUJMRSgpYCBzZWVtcwo+
ID4gdW5uZWNlc3NhcnkuCj4gPgo+Cj4gTm9wZS4gYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoKSBv
bmx5IHByZXZlbnRzIHJlbW92aW5nIHRoZSBkcml2ZXIgb25jZSBsb2FkZWQuCj4gU2luY2UgdGhl
IGRyaXZlciBpcyBkZWZpbmVkIGFzICd0cmlzdGF0ZScgaW4gS2NvbmZpZywgaXQgY2FuIHN0aWxs
IGJlIGxvYWRlZAo+IGR5bmFtaWNhbGx5LiBTbyBNT0RVTEVfREVWSUNFX1RBQkxFKCkgd291bGQg
c3RpbGwgYmUgbmVjZXNzYXJ5IGZvciB1ZGV2IHRvCj4gYXV0b2xvYWQgdGhlIG1vZHVsZSBiYXNl
ZCBvbiBtb2RhbGlhcy4KPgo+IC0gTWFuaQo+Cj4gLS0KPiDgrq7grqPgrr/grrXgrqPgr43grqPg
rqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCkhpIE1hbmkKClRoYW5rcyBmb3IgdGhlIGNs
YXJpZmljYXRpb24uIEkgc2VlIHRoYXQgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoKSBkb2VzIG5v
dApwcmV2ZW50IHRoZSBkcml2ZXIgZnJvbSBiZWluZyBidWlsdCBhbmQgbG9hZGVkIGFzIGEgbW9k
dWxlLCBzbwpNT0RVTEVfREVWSUNFX1RBQkxFKCkgaXMgc3RpbGwgbmVlZGVkIGZvciBtb2R1bGUg
YXV0b2xvYWRpbmcuCgpIb3dldmVyLCBzaW5jZSBidWlsdGluX3BsYXRmb3JtX2RyaXZlcigpIGRv
ZXMgbm90IHByb3ZpZGUgYW4gdW5yZWdpc3RlcgpwYXRoLCB0aGUgbW9kdWxlIGNhbm5vdCBiZSB1
bmxvYWRlZCB3aXRoIHJtbW9kLiBJcyB0aGF0IGludGVudGlvbmFsIGZvcgp0aGlzIGRyaXZlcj8K
ClRoYW5rcywKTmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
