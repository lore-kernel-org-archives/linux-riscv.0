Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E14CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeBkadwz3QfnVU10snUY2LXZhDCUg97iKcaJobYkibc=; b=q2ImaKtc+36KWv
	9eXn7PsewWI/frnmRJgZKEurNYJBu/xc9L5y8GO7pa7+0hp8tIMP+pvTvzAvib28r077SN6SWB+8M
	5D9shRYHhbvj084n5KphXNgRp4+lkqhGXq5MIgMOmUmITEk6LgEfcJkly3nuWQCfUfs1X1dKXOcZW
	x01v9SBSUVx2h+EI4whblW9bl57WyGEmx5BEU7u1N4SP9L9FbCGo54YazXAfzqzgIMbK0FZTDZPXE
	TDe+PdMBbWhpiJkKQJyaHWgptqrBKSDScvVN6iKCwflj6ydrUoxyMLDpfCNGbTKiqpHccTT0h1MSD
	pSSCyiM94TR3l5vlE24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa3J-00000006EBM-0Ehh;
	Thu, 14 May 2026 17:40:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa3G-00000006EAR-2uOw
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:40:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44a5174670eso4668462f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 10:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780449; x=1779385249; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnaJVAZDC++uQU8uHfAQulgEWlG+rcJqqh5PyI/aA3o=;
        b=fRgOre7jFRoy30N/21bQ7kNQB9UWKi9kqXONXoXDCCUuARVBrJ7ZaVCK9y++xqpMpL
         /ZCJzRpoLtviw86UtQYNrHdAj9lrphwjYy5+AbeiDBAmp7gja3OCY+Uw3m1VhXwL0pmz
         CxFMH2WzmaHioLGdQXEvaN2z20WxC2YkCxT4yYUTrVcZU9JnkfzcKJp5h5u2K9WlMxVZ
         SBSoKCx13+uya3t+qXd61cHXlaZvvAKs01CINflFCPyUN7MOadPzwNE2WjEGH7O15aKs
         y4bfiNWf1tUhknnxd1onDpz77QHTBifsVg6ItDy6XlL566Ank5JLK5Nmy870ZN5CVIom
         IasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780449; x=1779385249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnaJVAZDC++uQU8uHfAQulgEWlG+rcJqqh5PyI/aA3o=;
        b=S86T2ubSWIn7vo5sXBW+G0i+BnW1Q8nYmT3zjA5IgUSHDg9lYL4QtKG92HLBsaxOnO
         kEs/2GgTWLa6qWXK6pP2kch+lZSnARE+qS5PFR07No+rq57iqpgybw7O7sqIwdQbcgg2
         jT5e/0AzK/9+EEtw5bW4zezMxkK5DD0lrLaGScW1ghnfwg5inawPO6ftFAgdMozpvpOT
         +bMjhmJqZiLOd0xs/dQXS9+DMEdxeWvjHLk0bLVjHmaDaFER9D5AReXWkdpaQiPklR1q
         YqQ6VG0KeEEpegfzNof1UVU1ZL2oXsFFcqyg+Oak5RUC+5IeKKfIwhwxQxu25zH7zF7y
         MFGA==
X-Forwarded-Encrypted: i=1; AFNElJ9a/EqxtbKE72KBkphOYFe0bDk3kleWpDeTIWPRxo4urMXXukkfDP8CZUG9u6Wgh+zcNHQBWwEBdlDRWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Nnb0QobRnQM+5O3YWXrFB0DNjyiIwrhRZAF65TmX8hKGXLae
	WCq2xbvm/FuRQxfLBjAQSEIoS8wEb3FOKuMuvC7mqEx6MY/6uWgHypVp
X-Gm-Gg: Acq92OF+LalL9lfPR3sBt3KXMe75ilgm5K4LUzbZ8ZEgdyPHoi739I9DHaQusdVA1Qm
	9wZdT5AxI685VAKQg/U6W2d2rLNFimaQWzntWwpT8wS/W3XiaezSuOpyN6tKvOYThHXS3s6Fu0e
	XlCaOWooLQNlDpv7eHKUIw8r12NaebmLWWdNBk2RV9CkZUPbmZ66hnzXFTjWCcDhvCz7OnxUG6w
	Npk6eFCzMiOVVT2BDMgjyy4xtRdNE1CBKjlMMYufML7Jla06W44BwW0JquS3EtWDilfdB0paWZn
	fYIlfE1NDB/FLSWhdNx/e2n+PCgbgomJDwApgviydp2DlVE7C9pbjj+Dmvq/qa5ImffUhcvEfm8
	Sw9fzdHQh/8TU3FhjtxojIfQG4Ag6zUt2DQpJ/a866PMDvFcAxinu99Ia46XiS3uNa+7BqmXsOt
	8RSCEwU+7zij8IIRJkreqq9OGpVBTZEl9ncVvB+m87DDtVgcD/xKf7tBcyKw==
X-Received: by 2002:a05:6000:2c06:b0:45d:4fc0:fe0a with SMTP id ffacd0b85a97d-45e5c5dd346mr66055f8f.32.1778780448681;
        Thu, 14 May 2026 10:40:48 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:4f8c:d716:5699:930b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm7481200f8f.15.2026.05.14.10.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:40:48 -0700 (PDT)
Date: Thu, 14 May 2026 19:40:46 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
Message-ID: <agYJHrUHeSq_m788@osama>
References: <20260415220930.287592-1-osama.abdelkader@gmail.com>
 <CAAhSdy3LpnWtc9iTnND2ez4WK8WJUF_edYaDfD9Nd8_F3dPJFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3LpnWtc9iTnND2ez4WK8WJUF_edYaDfD9Nd8_F3dPJFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_104050_750459_7117F42E 
X-CRM114-Status: GOOD (  21.51  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMDc6MTM6MDRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIEFwciAxNiwgMjAyNiBhdCAzOjQw4oCvQU0gT3NhbWEgQWJkZWxrYWRlcgo+
IDxvc2FtYS5hYmRlbGthZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4ga3ZtX3Jpc2N2X3Zj
cHVfcG11X3NuYXBzaG90X3NldF9zaG1lbSgpIGFuZCBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZlbnRf
aW5mbygpCj4gPiByZXR1cm5lZCAtRU5PTUVNIGZyb20gdGhlIFNCSSBleHRlbnNpb24gaGFuZGxl
ciwgd2hpY2ggY2F1c2VkCj4gPiBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKSB0byBhYm9ydCBL
Vk1fUlVOIGFuZCBzdXJmYWNlIHRoZSBlcnJvciB0bwo+ID4gdXNlcnNwYWNlIGluc3RlYWQgb2Yg
Y29tcGxldGluZyB0aGUgRUNBTEwgd2l0aCBhIG5lZ2F0aXZlIFNCSSBlcnJvciBpbiBhMC4KPiA+
IFVzZSBTQklfRVJSX0ZBSUxVUkUgYW5kIHRoZSBub3JtYWwgcmV0ZGF0YSBwYXRoLCBtYXRjaGlu
ZyBvdGhlciBQTVUKPiA+IGhhbmRsZXJzIGFuZCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBjb21t
ZW50Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE9zYW1hIEFiZGVsa2FkZXIgPG9zYW1hLmFiZGVs
a2FkZXJAZ21haWwuY29tPgo+IAo+IFNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyB3aGVyZToK
PiAKPiAxKSBPbmUgcGF0Y2ggZml4aW5nIGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRf
c2htZW0oKQo+IDIpIFNlY29uZCBwYXRjaCBmaXhpbmcga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50
X2luZm8oKQo+IAo+IE1ha2Ugc3VyZSB0byBhZGQgRml4ZXMgdGFnIGluIGJvdGggcGF0Y2hlcy4K
PiAKPiBSZWdhcmRzLAo+IEFudXAKClRoYW5rcyBBbnVwIGZvciB0aGUgcmV2aWV3LCBJIGp1c3Qg
ZGlkIHRoYXQuCgpSZWdhcmRzLApPc2FtYQoKPiAKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMgfCAxMiArKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ID4gaW5kZXggZTg3
MzQzMGU1OTZiLi5mMzZiMDk5ZjQ0N2MgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3BtdS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gPiBAQCAtNDM1
LDggKzQzNSwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1lbShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcwo+ID4gICAgICAgICB9Cj4gPgo+
ID4gICAgICAgICBrdnBtdS0+c2RhdGEgPSBremFsbG9jKHNuYXBzaG90X2FyZWFfc2l6ZSwgR0ZQ
X0FUT01JQyk7Cj4gPiAtICAgICAgIGlmICgha3ZwbXUtPnNkYXRhKQo+ID4gLSAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgICBpZiAoIWt2cG11LT5zZGF0YSkgewo+ID4g
KyAgICAgICAgICAgICAgIHNiaXJldCA9IFNCSV9FUlJfRkFJTFVSRTsKPiA+ICsgICAgICAgICAg
ICAgICBnb3RvIG91dDsKPiA+ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgLyogTm8gbmVlZCB0
byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkgYXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3Qg
ZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gPiAgICAgICAgIGlmIChrdm1fdmNwdV93cml0ZV9ndWVz
dCh2Y3B1LCBzYWRkciwga3ZwbXUtPnNkYXRhLCBzbmFwc2hvdF9hcmVhX3NpemUpKSB7Cj4gPiBA
QCAtNDgwLDggKzQ4MiwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xvdwo+ID4gICAgICAgICB9
Cj4gPgo+ID4gICAgICAgICBlaW5mbyA9IGt6YWxsb2Moc2htZW1fc2l6ZSwgR0ZQX0tFUk5FTCk7
Cj4gPiAtICAgICAgIGlmICghZWluZm8pCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07Cj4gPiArICAgICAgIGlmICghZWluZm8pIHsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSBT
QklfRVJSX0ZBSUxVUkU7Cj4gPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgIHJldCA9IGt2bV92Y3B1X3JlYWRfZ3Vlc3QodmNwdSwgc2htZW0s
IGVpbmZvLCBzaG1lbV9zaXplKTsKPiA+ICAgICAgICAgaWYgKHJldCkgewo+ID4gLS0KPiA+IDIu
NDMuMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
