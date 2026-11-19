Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C9606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NZkRl/0q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rAbgVpBG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HzBiaLpzPzrPEBwnvkqKgOty4J9jUqreZyriqTeN72c=; b=NZkRl/0qiHrN9wtUvYRzUFD+Po
	o+DmVEYaGgrQcCWd+9gk5esMjM9VhcnFHF6gnVX6iXqAXDf3YUpcUfLcTAKHicP6hBHXjJjVJukhu
	mGchD35/Xg1sLSm+yn9BhFUuUevxRUbP/u0Tipg0btLvPCfjpDdL/v4tKj1KSUolV9+csNb+TAFjd
	KiCh3cZ1uDgMee2SzL7EAlmzMbEyVX26TWsCnPWhq9Q92gtMO/ZyHaFTBISV00zNeq62wwB5slE8P
	srE4EHOxUKwt1uSzcbVzi02Zdqkms4D806oYqijW5aWJa/vD6YhzdV0HxKl24KCZQuzAMeQwEixAl
	5+MztTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3rq-0000000COaJ-1M2Y;
	Thu, 19 Nov 2026 15:16:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3rm-0000000COYj-3Y7e
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:16:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28190115e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 07:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101360; cv=none;
        d=google.com; s=arc-20260327;
        b=ENDPqsOubrwZoTwWoDZzmNQkXP1oWAqa+gLMVCP1cVAfMw0Tvm14aWcNHMTt5fOKxe
         55835pXxyIPd68r3OQQCohZV/z6tL33S5+e0s/yOtacDPeGF2fr/W78kgz4Yv2ClxFvw
         b8XYxerMaDfxXiNioXZrL5hgTTBkWU7iexoEuPyiphBNZ3rqOKgAg8lL4buPx/CxBp2R
         ZOjTo/w+kuv3AZ3a0xlzd5L+Dcgwau61yNVTnUmyY68SYqxflBI1WvgWCYgJJcz5M/bd
         XJ2siHGehZrnJ8jgfVNWHlJqTbYyGzNNFsh5D4Zi1lE9XotSkEISbnXddZILX+MWnPja
         Fbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        fh=bLcnd/PhezhX69/CbFGinKrbge3DdGYUkFjWpJxuyP8=;
        b=cZoZPKp3F04C7xjDnRQG86HG5hyNbag8B2hbKD5K/6pxDqhBRqYl4uny8FKNNkzbaZ
         tQ3uuhcfftpdSHvpDABBq+Xt1qXDfi4Licd4oZVH5q3f2KpBCRlCFHxGKyt3YwzxBQB/
         7f5xe9oFbWBoY68aSrqwfZk1DtoAxhYRXBmLjHeg8aYiqmyYNTbLYTRJ4xNEwglXs/9y
         Rbwphy4KG5eR/yjFb4OTdXYRwbQNwFQ6vTguoGWC+UStNQgwQz9nMDv2puOTDbggw6ct
         wV137w/xztls8o53qMTehQTP/eRCxziX53eE5vu7/D/png4cKdXe034i7xU3pSx3I+hX
         18cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101360; x=1795706160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=rAbgVpBGUxitNBwdmmcpn+8l8Siqeo0eA9lLYafs+lbXCw7oGCmXHMk+Jx4VIcX1us
         MfLBdfDYuPaMqjkm/GIzfPPTD/UmVeEK4CJz9RlGlRQimF3u35AM/KQHXf4O5MdcdG6A
         9r73qDw0kmVHD/ZAIC+NozrbkaCfE0Ixl68tnb9x5bM5o+m2bKqy0hlOxP71tpqbsUi2
         QeNKRIAFplOIOmkL3MAtPcDpPviFTEjIy0bAfdWkhDhAfEvqRW3s4dIFTJeJkECiwcK5
         Dq1tMIklQuvC8Mo2173DQaa4tqBVOuvvksgxI4wEa0vL8rFkw0+TZ+encYdncD5N98YD
         r/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101360; x=1795706160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=RE3vm7eXhEZ8J44vmSOkjVbs75vBydENySuhYfL6UKD7WAB8KUXMqp40FfVpWPXTwL
         rG1Z6j5EeK7LUYwIhU8+y14g0Dvap50yaDdgInG0op0TeIP0N3jPRDIlEmejLsiF4Okc
         gFB7+fBxgPnQP4GXaiDNkBqpzwbM0oU3Bbt7ijbtZjpswBZtV02/86TopTwJ9UemsmQy
         sfKk1MJOvJwnpHnYnqy3guU4LfB4GfU4pVccjOEzcIhgBAqyZowgVfGDejQxd1vly7vV
         vYVJrH666tSj06dO3UhHu97GIQV3pIjK4UjJcMz53eWDxibtbTuy5AO4JRFBf7wHVF3o
         bRsQ==
X-Forwarded-Encrypted: i=1; AL+hErGl6kcqyqjIEBDflWa9SWcHoryfYknyyPaexnVCvphHX6tkvYufeal87nDXeEutfVg6tmG5z9dAfIt1ug==@lists.infradead.org
X-Gm-Message-State: APuU4Z/lfNj/iiVQzNYQg8gULfmm15V03BtD9WKwaSxnl5KtVLKnRwbu
	emZ6LM8VCXQx8mLUk5X6uNfBu9Npu8QkR0TXJnv4miLt0J+DNolFGh0sclhB5fa4jVGatEPgiYa
	uTcJmv6VLLrZXQ9g+DiABhPLEzCV2oQV2HyW0CPIFgw==
X-Gm-Gg: AYBFou07xzgs1hjYXMnbV8+jit9K2twflYKiMdX458bxCLRNOrFxsIIDx9Y7+TgzzWE
	3vB0ST+QX31BRwsLjmCvr9HCh+elLFsd9s4ICSNEHwiv6tNurRjKHv13vQbltYvuipe/uRHw8ML
	fMfxZPrGND475xsJkLfIizkOydzQ36p3N+y8ZJEmb4Xr3h63K606csl1G87OqINjTjOfQqi8UgH
	Y0FSNfRrYqy4ISI7RMRyI0DJIe1M5dojEUGoxqagOPwpe2eyoh6g2dMkmrVYCZ+YzlKLaE/ovCG
	LF4ZfhKw54Ygu6kz6bYmBaIdQSwSbLKQmmx27jgMOWWQGaiuu8I1mFRksGc/krKSlwj/bc4Az4V
	0gCy0IWxCPF1mYfFnAyH98AQAXaV9a5i9hncHdB4yE/78ItVER7+Pzu+4xkDNXQgjILW3Vjagmu
	NWVYEoRbgjD8g8vKbUEj61xHCwRufCoJCK6ujVQrj1REr00xNTUEZaid3P3XiIO4HMajpsCr3q2
	LRf
X-Received: by 2002:a05:600c:c106:b0:4bb:87be:c138 with SMTP id
 5b1f17b1804b1-4bb87bec13fmr12856555e9.32.1795101360089; Thu, 19 Nov 2026
 07:16:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:45:48 +0530
X-Gm-Features: Aa3M54riNYPYm1hR-WMNehgnqK1cKsrsmx9wlvpLX0ldc8qDneAu48N6AszDino
Message-ID: <CAAhSdy1QdF3rA3bkKsdOe-pPV+JekgUeFB2LOirCTf3L_qjK_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_071602_939550_D813B951 
X-CRM114-Status: GOOD (  19.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzoyMeKAr1BNIFZpa3JhbSBTaW5naAo8dmlrcmFtLnNp
bmdoM0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFJJU0NWIENUUiBleHRlbnNpb24gc3Vw
cG9ydHMgYSBtYXhpbXVtIGRlcHRoIG9mIDI1NiBsYXN0IGJyYW5jaCByZWNvcmRzLgo+IEN1cnJl
bnRseSByZW1vdmVfbG9vcHMoKSBjYW4gb25seSBwcm9jZXNzIDEyNyBlbnRyaWVzIGF0IG1heC4g
VGhpcyBsZWFkcwo+IHRvIHNhbXBsZXMgd2l0aCBtb3JlIHRoYW4gMTI3IGVudHJpZXMgYmVpbmcg
c2tpcHBlZC4gVGhpcyBjaGFuZ2Ugc2ltcGx5Cj4gdXBkYXRlcyB0aGUgcmVtb3ZlX2xvb3BzKCkg
bG9naWMgdG8gYmUgYWJsZSB0byBwcm9jZXNzIDI1NiBlbnRyaWVzLgo+Cj4gQ28tZGV2ZWxvcGVk
LWJ5OiBSYWpuZXNoIEthbndhbCA8cmFqbmVzaC5rYW53YWw0OUBnbWFpbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUmFqbmVzaCBLYW53YWwgPHJham5lc2gua2Fud2FsNDlAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFZpa3JhbSBTaW5naCA8dmlrcmFtLnNpbmdoM0Bvc3MucXVhbGNvbW0uY29t
Pgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjExMDYxNzM5NDIuMzE3NTA2
OS0yLXZpa3JhbS5zaW5naDNAb3NzLnF1YWxjb21tLmNvbQo+IFNpZ25lZC1vZmYtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpJIHRoaW5rIHlvdSBhY2NpZGVudGFsbHkgcGlj
a2VkICJMaW5rOiIgYW5kICJTaWduZWQtb2ZmLWJ5OiIgbXlzZWxmLgpQbGVhc2UgZHJvcCB0aGVz
ZSBsaW5lcyBmcm9tIGFsbCBwYXRjaGVzLgoKVHlwaWNhbGx5LCB0aGUgIkxpbms6IiBhbmQgdGhl
IGZvbGxvd2luZyAiU2lnbmVkLW9mZi1ieToiIGlzIGFkZGVkIGJ5CiJiNCBhbSAtbCAtcyIgb3B0
aW9ucyBzbyBhcyBhIGNvbnRyaWJ1dG9yIGRvbid0IHVzZSAiLWwgLXMiIG9wdGlvbnMKd2hlbiB1
c2luZyAiYjQgYW0iLgoKPiAtLS0KPiAgdG9vbHMvcGVyZi91dGlsL21hY2hpbmUuYyB8IDIxICsr
KysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvbWFjaGluZS5j
IGIvdG9vbHMvcGVyZi91dGlsL21hY2hpbmUuYwo+IGluZGV4IDA3NmQxNjczODBmMi4uZjFlZmQx
MTIwYTk1IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMKPiArKysgYi90
b29scy9wZXJmL3V0aWwvbWFjaGluZS5jCj4gQEAgLTIzMzQsMjUgKzIzMzQsMzIgQEAgc3RhdGlj
IHZvaWQgc2F2ZV9pdGVyYXRpb25zKHN0cnVjdCBpdGVyYXRpb25zICppdGVyLAo+ICAgICAgICAg
ICAgICAgICBpdGVyLT5jeWNsZXMgKz0gYmVbaV0uZmxhZ3MuY3ljbGVzOwo+ICB9Cj4KPiAtI2Rl
ZmluZSBDSEFTSFNaIDEyNwo+IC0jZGVmaW5lIENIQVNIQklUUyA3Cj4gLSNkZWZpbmUgTk9fRU5U
UlkgMHhmZgo+ICsjZGVmaW5lIENIQVNIQklUUyA4Cj4gKyNkZWZpbmUgTk9fRU5UUlkgMHhmZlUK
Pgo+IC0jZGVmaW5lIFBFUkZfTUFYX0JSQU5DSF9ERVBUSCAxMjcKPiArI2RlZmluZSBQRVJGX01B
WF9CUkFOQ0hfREVQVEggMjU2Cj4KPiAgLyogUmVtb3ZlIGxvb3BzLiAqLwo+ICsvKiBOb3RlOiBM
YXN0IGVudHJ5IChpPT1mZikgd2lsbCBuZXZlciBiZSBjaGVja2VkIGFnYWluc3QgTk9fRU5UUlkK
PiArICogc28gaXQncyBzYWZlIHRvIGhhdmUgYW4gdW5zaWduZWQgY2hhciBhcnJheSB0byBwcm9j
ZXNzIDI1NiBlbnRyaWVzCj4gKyAqIHdpdGhvdXQgY2F1c2luZyBjbGFzaCBiZXR3ZWVuIGxhc3Qg
ZW50cnkgYW5kIE5PX0VOVFJZIHZhbHVlLgo+ICsgKi8KPiAgc3RhdGljIGludCByZW1vdmVfbG9v
cHMoc3RydWN0IGJyYW5jaF9lbnRyeSAqbCwgaW50IG5yLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBpdGVyYXRpb25zICppdGVyKQo+ICB7Cj4gICAgICAgICBpbnQgaSwgaiwgb2Zm
Owo+IC0gICAgICAgdW5zaWduZWQgY2hhciBjaGFzaFtDSEFTSFNaXTsKPiArICAgICAgIHVuc2ln
bmVkIGNoYXIgY2hhc2hbUEVSRl9NQVhfQlJBTkNIX0RFUFRIXTsKPgo+ICAgICAgICAgbWVtc2V0
KGNoYXNoLCBOT19FTlRSWSwgc2l6ZW9mKGNoYXNoKSk7Cj4KPiAtICAgICAgIEJVR19PTihQRVJG
X01BWF9CUkFOQ0hfREVQVEggPiAyNTUpOwo+ICsgICAgICAgQlVHX09OKFBFUkZfTUFYX0JSQU5D
SF9ERVBUSCA+IDI1Nik7Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucjsgaSsrKSB7Cj4g
LSAgICAgICAgICAgICAgIGludCBoID0gaGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUykgJSBD
SEFTSFNaOwo+ICsgICAgICAgICAgICAgICAvKiBSZW1haW5kZXIgZGl2aXNpb24gYnkgUEVSRl9N
QVhfQlJBTkNIX0RFUFRIIGlzIG5vdAo+ICsgICAgICAgICAgICAgICAgKiBuZWVkZWQgYXMgaGFz
aF82NCB3aWxsIGFueXdheSBsaW1pdCB0aGUgaGFzaAo+ICsgICAgICAgICAgICAgICAgKiB0byBD
SEFTSEJJVFMKPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGludCBoID0g
aGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUyk7Cj4KPiAgICAgICAgICAgICAgICAgLyogbm8g
Y29sbGlzaW9uIGhhbmRsaW5nIGZvciBub3cgKi8KPiAgICAgICAgICAgICAgICAgaWYgKGNoYXNo
W2hdID09IE5PX0VOVFJZKSB7Cj4gLS0KPiAyLjQzLjAKPgoKT3RoZXJ3aXNlLCBMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVw
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
