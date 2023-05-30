Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842F0C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnbeYcb1u4T1yGAk9x9AINS6FALmMJSRFdFn6Ka6gwQ=; b=Mz8at/F/hDKtyI
	aO8ufaa/vKhVllPgz/2ZW5QhQmA990rXqVU9ola1nxaFFf43lmryg18zdB3usoQ3YZU1CCh4tGX2I
	JNIL9KZkPrjTjGzl1E9CuJfOWeQbCJfQj8HWxAtl1sY7KKHyO/CiHLXPotF/M09+UcDB28Bi+cTwH
	nlzcaPNqDiNNVPplSxXSWvTIgftt12NSzWdJHcSBEm68cnTK5fnRj6M4cpiN90dan/Y4axqpYzx8z
	GT+hpfMenIzGGMYQ0RQr1TgU4VcQKpuxf3IC7ltnRN4BpGAIHaknWyLPcgwn7XeqeQQcGCKnNQ95a
	qWjP9m41Kv/ikExCN30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43Iy-00ElnI-0k;
	Tue, 30 May 2023 17:38:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43Iv-00Elm4-2p
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:38:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30aebe2602fso1804787f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685468314; x=1688060314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FrHMbTIbU7D3t1WRRQQxrIW0F7tJVKN0TYQHrkhWx4k=;
        b=bLhbmRnEJ0aQBK/C3WZRinhj9quWRoH4Kn+HXqsUG2RINWRSyVcgEtimQsBKg9fH+L
         AO//h1nomqDEf0lfuWnOeZ1RghrI6hajTL1/o6ZBXNwf54qsziybQlwq8COLcdGHFNcK
         JIvox3ab6m/Q3iOqEgfEu9v2lUo7IjooI7bkE1/u3Ty+hPVykkRpByn1pXie7OP/t/4g
         GfFEB6WH2ofIH1vqYyMNta40kBCWiNzZkZWiX5lGiStaXqkjXjiuoHvvxe2x67Q3OKZ4
         hbj9v2PkYI+U1iyQY/oOGyEsCRk3yQGDsp4tNfhq9UHeyorsjKhcOkcax0+0eqheejIf
         VXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685468314; x=1688060314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrHMbTIbU7D3t1WRRQQxrIW0F7tJVKN0TYQHrkhWx4k=;
        b=PXGzXwT+WvFzQKmbIH/ofO5eCzHTIa6nD6HrzlmddtxWbkhvIoaUe8AKuEvsJ3BJ0s
         Pyh6sJk2JTR6scB+cBPZS8+ishgZgx1uvpBpzCxU8VCvDVWAlgnZK9W9YHtKkv/uAS5i
         GD+spQpICLDCpKuPcvAJhVu2wOWBY4BzKP4+t7qdFB0wMwYTHKUg0xmyCrA5QVQtsurW
         r1FCsU+0DbjNM98/e/I8I4Hmes/1oQMqg9Y4i+txFH4cBOcRJUWqFBZ0l3/l/72NUIML
         FM16X/vDALg65kv3408SxhqYbvGmEbsPIf43Rbaz4l3hBVQ34PbCV78nJEWVB5vgkScz
         ySxQ==
X-Gm-Message-State: AC+VfDyuBA3aDHlPf5PBMh44WixdjBz+hJMghf3Hduq+FSicXcaPERkZ
	nFdFRc6iIB4G3Y3oe42YbWWUrA==
X-Google-Smtp-Source: ACHHUZ6q3BKexvJC51GGJFG7kExmKMsuNL9f5Ici4Da4HE0wF9yHXGGvW+vifXhAaNW8XgM1QYpc6g==
X-Received: by 2002:a5d:51d1:0:b0:30a:e66d:25b7 with SMTP id n17-20020a5d51d1000000b0030ae66d25b7mr2143734wrv.13.1685468314120;
        Tue, 30 May 2023 10:38:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l19-20020a5d5273000000b0030ae09c5efdsm4005750wrc.42.2023.05.30.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:38:33 -0700 (PDT)
Date: Tue, 30 May 2023 19:38:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 2/3] RISC-V: KVM: Convert extension_disabled[] to
 ext_status[]
Message-ID: <20230530-847c5615f38719be61e86d06@orel>
References: <20230526102540.105013-1-ajones@ventanamicro.com>
 <20230526102540.105013-3-ajones@ventanamicro.com>
 <CAAhSdy01s_89rhzhPtxg4HYqyjiHkUpddc8WcttgZC8dndxF-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy01s_89rhzhPtxg4HYqyjiHkUpddc8WcttgZC8dndxF-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_103841_945466_AC4DB1C1 
X-CRM114-Status: GOOD (  24.56  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTA6Mjg6MTZQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBGcmksIE1heSAyNiwgMjAyMyBhdCAzOjU14oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2hhbmdlIHRoZSBib29sZWFuIGV4
dGVuc2lvbl9kaXNhYmxlZFtdIGFycmF5IHRvIGFuIGFycmF5IG9mIGVudW1zLAo+ID4gZXh0X3N0
YXR1c1tdLiBGb3Igbm93LCB0aGUgZW51bSBvbmx5IGhhcyB0d28gc3RhdGVzLCB3aGljaCBjb3Jy
ZXNwb25kCj4gPiB0byB0aGUgcHJldmlvdXMgYm9vbGVhbiBzdGF0ZXMsIHNvIHRoaXMgcGF0Y2gg
aGFzIG5vIGludGVuZGVkCj4gPiBmdW5jdGlvbmFsIGNoYW5nZS4gVGhlIG5leHQgcGF0Y2ggd2ls
bCBhZGQgYW5vdGhlciBzdGF0ZSwgZXhwYW5kaW5nCj4gPiB0aGUgcHVycG9zZSBvZiBleHRfc3Rh
dHVzW10uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFu
YW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmggfCA3ICsrKysrKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAg
ICAgIHwgOSArKysrKystLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
Cj4gPiBpbmRleCA0Mjc4MTI1YTM4YTUuLmNkYTk5ZmMzZDg5NyAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiA+IEBAIC0xNCw5ICsxNCwxNCBAQAo+ID4gICNk
ZWZpbmUgS1ZNX1NCSV9WRVJTSU9OX01BSk9SIDEKPiA+ICAjZGVmaW5lIEtWTV9TQklfVkVSU0lP
Tl9NSU5PUiAwCj4gPgo+ID4gK2VudW0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTIHsKPiAKPiBU
aGlzIHVwcGVyLWNhc2UgbmFtZSBvZiBlbnVtIGxvb2tzIG9kZC4KCkkgYWdyZWUuIEkgc2F3IHRo
ZSB1cHBlcmNhc2UgZW51bSBuYW1lcyBpbiB0aGUgdWFwaSBhbmQgbWF0Y2hlZCB0aGF0LCBidXQK
bm93IEkgc2VlIHRoZSBub24tdWFwaSBlbnVtcyBoYXZlIG5vcm1hbCBsb3dlcmNhc2UgbmFtZXMu
IEknbGwgc2VuZCBhIHYzCndpdGggYSBsb3dlcmNhc2UgbmFtZS4KCj4gCj4gPiArICAgICAgIEtW
TV9SSVNDVl9TQklfRVhUX0FWQUlMQUJMRSwKPiA+ICsgICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRf
VU5BVkFJTEFCTEUsCj4gPiArfTsKPiA+ICsKPiA+ICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRl
eHQgewo+ID4gICAgICAgICBpbnQgcmV0dXJuX2hhbmRsZWQ7Cj4gPiAtICAgICAgIGJvb2wgZXh0
ZW5zaW9uX2Rpc2FibGVkW0tWTV9SSVNDVl9TQklfRVhUX01BWF07Cj4gPiArICAgICAgIGVudW0g
S1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTIGV4dF9zdGF0dXNbS1ZNX1JJU0NWX1NCSV9FWFRfTUFY
XTsKPiA+ICB9Owo+ID4KPiA+ICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiB7Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmMKPiA+IGluZGV4IDZhYTE1ZjFiOTdkOS4uMjhlNTViYTAyM2RjIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYwo+ID4gQEAgLTE1NSw3ICsxNTUsOCBAQCBzdGF0aWMgaW50IHJpc2N2X3ZjcHVfc2V0
X3NiaV9leHRfc2luZ2xlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ICAgICAgICAgaWYgKCFz
ZXh0KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ID4KPiA+IC0gICAgICAg
c2NvbnRleHQtPmV4dGVuc2lvbl9kaXNhYmxlZFtzZXh0LT5leHRfaWR4XSA9ICFyZWdfdmFsOwo+
ID4gKyAgICAgICBzY29udGV4dC0+ZXh0X3N0YXR1c1tzZXh0LT5leHRfaWR4XSA9IHJlZ192YWwg
Pwo+ID4gKyAgICAgICAgICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX0FWQUlMQUJMRSA6IEtWTV9S
SVNDVl9TQklfRVhUX1VOQVZBSUxBQkxFOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAg
fQo+ID4gQEAgLTE4MCw3ICsxODEsOCBAQCBzdGF0aWMgaW50IHJpc2N2X3ZjcHVfZ2V0X3NiaV9l
eHRfc2luZ2xlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ICAgICAgICAgaWYgKCFzZXh0KQo+
ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ID4KPiA+IC0gICAgICAgKnJlZ192
YWwgPSAhc2NvbnRleHQtPmV4dGVuc2lvbl9kaXNhYmxlZFtzZXh0LT5leHRfaWR4XTsKPiA+ICsg
ICAgICAgKnJlZ192YWwgPSBzY29udGV4dC0+ZXh0X3N0YXR1c1tzZXh0LT5leHRfaWR4XSA9PQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9BVkFJ
TEFCTEU7Cj4gPgo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiBAQCAtMzE2LDcgKzMx
OCw4IEBAIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICprdm1fdmNwdV9zYmlf
ZmluZF9leHQoCj4gPiAgICAgICAgICAgICAgICAgaWYgKHNleHQtPmV4dF9wdHItPmV4dGlkX3N0
YXJ0IDw9IGV4dGlkICYmCj4gPiAgICAgICAgICAgICAgICAgICAgIHNleHQtPmV4dF9wdHItPmV4
dGlkX2VuZCA+PSBleHRpZCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNleHQt
PmV4dF9pZHggPCBLVk1fUklTQ1ZfU0JJX0VYVF9NQVggJiYKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICBzY29udGV4dC0+ZXh0ZW5zaW9uX2Rpc2FibGVkW3NleHQtPmV4dF9pZHhdKQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQt
PmV4dF9pZHhdID09Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9VTkFWQUlMQUJMRSkKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gc2JpX2V4dFtpXS5leHRfcHRyOwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+IC0t
Cj4gPiAyLjQwLjEKPiA+Cj4gCj4gT3RoZXJ3aXNlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUuCj4g
Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4KClRoYW5r
cywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
