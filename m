Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E7606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NeUm8tK0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=DlXbDuYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=obEf/OXrG2HpIVnF45ZZizMul5mVgb+89iBcbDK2IX8=; b=NeUm8tK0yM8O93HI+66oWaY410
	Gvi6X0MBAZUyIr4wkrBWzwlWsHPHU/38YUPQTlZFSI80SSRkg8LULw6GcX2wKHfqF3v4mFwsY16bo
	NQCeaIUK18Yya5iGCFmIFHlrm/XgA5v1TCx894hd5g5iWxZOjaMwiXaY5KDWZpp4wmCuNK5/4rg0o
	AhE7C5Vc08J/qLDrxii6Yv8mpxMCzDiUNN9bSWa1vTe2MtKa3h74R0tFDAD6xQFldwGEM+SaQ7KpH
	DK1X1pTntIE/UXhh8APdfNatUYYGjyzK9b2Y6pMpLLSC2W65wKIewX/t+U7/JG8KwCU+5cN61hX9W
	zBL4IxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKa-0000000GWwx-09la;
	Fri, 23 Oct 2026 14:33:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGKQ-0000000GWnA-2l6J
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 14:33:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8914565e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 07:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765985; cv=none;
        d=google.com; s=arc-20260327;
        b=HC3WTr4L2Y0Q/w88/bboSzIxPiTizUpAJtdwDSP9s8/4dxhpqX+fCmA11B19lRXyNT
         5xVucnR6A0iVkgzdXvZU8MhkWj530leyyfblbkjZjny2EwUnlepHPxueVwnNGZKwEQzE
         ysiO9/pf7DyA3I8uusRa2NMthR8DeLincEwxrmgMGIFQ4ATujZycNCZxpvzs3C1CIls1
         XE/lA2wIjePfzGq3O1eDv7k6nqB63T1BoZVNbM+bmtZX07i1j4RNT8onWYaYnJ6Kk+Oj
         k1S463OXi+zweFttzwfRdLNu+cRC8QvwLpNZlOPAmvObmOSV/JMIUhPiH1nAQy8+ryMV
         7bBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        fh=oDfswt7jnjUwxywH4f37L1UKr397iq/npZPTbumuSzo=;
        b=dqY3IhqCLYdJVGUIHkDgicFL7h0xVtVfMZJ4WNGfnd5A6+oq7/i9H83sdaZ4ErRhp3
         QWnvfL2oD71n/OrJul/eb56cQTvtbf7rMNKRYX4yRoO7q8/eb/MLc3xtyt3u4kAIu/AC
         2Xt/3wePg9rWcwBGqvvfcHIq5xQkMoQOVoYKO6Z041jNQQR4uDeaGjUoYR695cdPX9+P
         ecD6nVBQQqVqCQj6saMTZk9M3Sfph8uGuMAvaJP0Mk7n2AtFjOgOLiQtXaPMPPXqCpjj
         lyrQJHxBy9+dJljvWX2FaBymJN8ipjH2lEc7pjvtJLSYzKKkgQpI7tzvg/py3Q6OCrCt
         Y7gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765985; x=1793370785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=DlXbDuYvl7eurgut9e45RtfPXk+X/isU9Li0hsllTNKXW/PPO9Xs9BdBUHlqGsiKw1
         fTXu7Qy62o+H4i3CJJGetq0t9aSUcxGipAWezNGHq+3S9jiUeflwEEdzcQC7ybRgIBDt
         buPKf71esrBz/p4OveSmW2EFQCYzbKnxmbO4ZGWd2S0GhTH0tdyww2Lye5hGqqjxkEuw
         pG9w6lj+FjGruAMBL3mZtNCrZq3ogLuSp1IBJsVjq94cbybjUJwUkKLNiDi6ZbX8KBbr
         x8s3ym9a69M/E7LVg2HXTarFQGGDbL39RCe3HrGDKnrPmTysUAna68yxNiKnQdBVfoaZ
         YX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765985; x=1793370785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=lMBrf7/Ps3g2u2MItZjbqzwuvH6mvsjurojd5VMppPmOnuT4jee3DdVHRD+fWeuq6/
         T5RKqQ1/WV8tjEBLMRzyRMoH03EmEQlynYsyWHvTJDGQhPHYpMCDLKQxpGQlfYgidm5H
         yXFAPc1vZVIlPxDO5kJJpiKebHIQEmMCVIczXF+gy1+TQeYYNt4ZbsEUc73SXW0BULx2
         pGe6PnrU/xPEzjN/wvWy2VotLOCC6u9HUtG7qJ4UTnzZdm3gfPHrwLcp3QUrtD3Sd7uN
         mr0qIacFo3tHiZZm3CiMvIVnKaiBYzgFFEVYS7F+HBikDyeGs8xwDjJYEHZwUCo+QUY+
         Qt4w==
X-Forwarded-Encrypted: i=1; AKwUvBx+tB7aynaYzDkq6pC25fyUSJDQy2FbtBbOKaIt6Qgvs20TY6Xx6Tw01Rk8B92JryYquLJgi5yiT2cRMw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJZzyVmjustXqeOEtqVHqYnk8qfMy97Bdd8WWTjbtjzjo9vPCzc
	8XKEGGvo7XiXINnRX4aLcV56wiaGbJGane9NONyWhB+4iDiIZLb4IhiykTK204jmNrZttsVzV6s
	w8s3igr9hy5YAwvUqhes4w2CY6qRS+NvWQk+1A2Rebw==
X-Gm-Gg: AYBFou26Qzygilz36byN9IxweO0gpzvndF/Z4fDgkFZtvjWKdgnG0do4y3/InD9IoCi
	voVwnTw5sgQhH0mzwXYMimIBxEvQrdhW7Ovxc7eBUl8ZC6vOWXXTkTdD16XPKg1FvnAgOqYxOv7
	4D1/Xk+mnG8hbaMmQCSwnKlT0gYE7hiSOagjplZrsf3I8XI1p+DWF7+oj5Vq/P3OtCkCOHjpQxg
	jT6Qsa9Kfd10IDHZEZ6zlGxMFA5HU1AlLJVioaUxyiqqOkqGwbZ2KdgNkQwNSci2V+KnzTXHsIK
	dp6jtyHMySmjfEMZbxjsxFn27TxksCQ43FZ+a7RE4ll4QoESj/wgdI3YQmFd3PJ/OBpsc0T2ygq
	ikIokKpCD9hlEkTtXtYJeCZaz2ifpitqzgZ1ggBm60jVIhAaMAthwuySgOI3X/rimnygUkk2YX0
	MKxgALDXwbDSLXxVdCNcg7cr0OlF+C5wR0eC4lr4q4fGLoZ/lpi4fei+yb
X-Received: by 2002:a05:600c:1392:b0:4a1:742e:3 with SMTP id
 5b1f17b1804b1-4a211ecf2d6mr37791005e9.27.1792765984553; Fri, 23 Oct 2026
 07:33:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-15-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-15-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:52 +0530
X-Gm-Features: AclHuK9X4t2_Wp-iA3viS1hPfBa-r77osa46AUeHd9u6gOQJy4rh2geNlywyhlQ
Message-ID: <CAAhSdy1zHzqf0Ozgoz_nT81_tjg6ojsNgGQMUpeXNaJ6AN4yug@mail.gmail.com>
Subject: Re: [PATCH v9 15/20] RISC-V: perf: Skip PMU SBI extension when not implemented
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_073306_760993_073663C3 
X-CRM114-Status: GOOD (  23.68  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBBdWcgNywgMjAyNiBhdCAxOjQw4oCvUE0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBGcm9tOiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgo+Cj4gV2hlbiB0aGUgUE1VIFNCSSBleHRlbnNpb24gaXMgbm90IGltcGxlbWVu
dGVkLCBzYmlfdjJfYXZhaWxhYmxlIHNob3VsZAo+IG5vdCBiZSBzZXQgdG8gdHJ1ZS4gVGhlIFNC
SSBpbXBsZW1lbnRhdGlvbiBmb3IgY291bnRlciBjb25maWcgbWF0Y2hpbmcKPiBhbmQgZmlybXdh
cmUgY291bnRlciByZWFkICBzaG91bGQgYWxzbyBiZSBza2lwcGVkIHdoZW4gdGhlIFNCSSBleHRl
bnNpb24KPiBpcyBub3QgaW1wbGVtZW50ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRy
YSA8YXRpc2hwQG1ldGEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hh
cmxpZUByaXZvc2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgoKPiAtLS0KPiAgZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4IGZkNGJmODgwNGM5YS4uZjBiOGI2ZWZmMmVh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2
ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTQ5MywyNyArNDkzLDMyIEBAIHN0YXRpYyB2
b2lkIHJ2cG11X3NiaV9jaGVja19ldmVudChzdHJ1Y3Qgc2JpX3BtdV9ldmVudF9kYXRhICplZGF0
YSkKPiAgICAgICAgIH0KPiAgfQo+Cj4gLXN0YXRpYyB2b2lkIHJ2cG11X3NiaV9jaGVja19zdGRf
ZXZlbnRzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiArc3RhdGljIHZvaWQgcnZwbXVfY2hl
Y2tfc3RkX2V2ZW50cyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIHsKPiAgICAgICAgIGlu
dCByZXQ7Cj4KPiAtICAgICAgIGlmIChzYmlfdjNfYXZhaWxhYmxlKSB7Cj4gLSAgICAgICAgICAg
ICAgIHJldCA9IHBtdV9zYmlfY2hlY2tfZXZlbnRfaW5mbygpOwo+IC0gICAgICAgICAgICAgICBp
ZiAocmV0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHByX2VycigicG11X3NiaV9jaGVja19l
dmVudF9pbmZvIGZhaWxlZCB3aXRoIGVycm9yICVkXG4iLCByZXQpOwo+IC0gICAgICAgICAgICAg
ICByZXR1cm47Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAocmlzY3ZfcG11X3NiaV9hdmFpbGFi
bGUoKSkgewo+ICsgICAgICAgICAgICAgICBpZiAoc2JpX3YzX2F2YWlsYWJsZSkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IHBtdV9zYmlfY2hlY2tfZXZlbnRfaW5mbygpOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwcl9lcnIoInBtdV9zYmlfY2hlY2tfZXZlbnRfaW5mbyBmYWlsZWQgd2l0aCBlcnJv
ciAlZFxuIiwgcmV0KTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAg
ICAgICAgICAgIH0KPgo+IC0gICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBt
dV9od19ldmVudF9zYmlfbWFwKTsgaSsrKQo+IC0gICAgICAgICAgICAgICBydnBtdV9zYmlfY2hl
Y2tfZXZlbnQoJnBtdV9od19ldmVudF9zYmlfbWFwW2ldKTsKPiArICAgICAgICAgICAgICAgZm9y
IChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9zYmlfbWFwKTsgaSsrKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJ2cG11X3NiaV9jaGVja19ldmVudCgmcG11X2h3X2V2
ZW50X3NiaV9tYXBbaV0pOwo+Cj4gLSAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IEFSUkFZX1NJ
WkUocG11X2NhY2hlX2V2ZW50X3NiaV9tYXApOyBpKyspCj4gLSAgICAgICAgICAgICAgIGZvciAo
aW50IGogPSAwOyBqIDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfc2JpX21hcFtpXSk7IGor
KykKPiAtICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGludCBrID0gMDsgayA8IEFSUkFZX1NJ
WkUocG11X2NhY2hlX2V2ZW50X3NiaV9tYXBbaV1bal0pOyBrKyspCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBydnBtdV9zYmlfY2hlY2tfZXZlbnQoJnBtdV9jYWNoZV9ldmVudF9z
YmlfbWFwW2ldW2pdW2tdKTsKPiArICAgICAgICAgICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9zYmlfbWFwKTsgaSsrKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGZvciAoaW50IGogPSAwOyBqIDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRf
c2JpX21hcFtpXSk7IGorKykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvciAo
aW50IGsgPSAwOyBrIDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfc2JpX21hcFtpXVtqXSk7
IGsrKykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcnZwbXVfc2Jp
X2NoZWNrX2V2ZW50KCZwbXVfY2FjaGVfZXZlbnRfc2JpX21hcFtpXVtqXVtrXSk7Cj4gKyAgICAg
ICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBET19PTkNFX0xJVEVfSUYoMSwgcHJfaW5mbywK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJCb290IHRpbWUgY29uZmlnIG1hdGNo
aW5nIG5vdCByZXF1aXJlZCBmb3Igc21jZGVsZWdcbiIpOwo+ICsgICAgICAgfQo+ICB9Cj4KPiAt
c3RhdGljIERFQ0xBUkVfV09SSyhjaGVja19zdGRfZXZlbnRzX3dvcmssIHJ2cG11X3NiaV9jaGVj
a19zdGRfZXZlbnRzKTsKPiArc3RhdGljIERFQ0xBUkVfV09SSyhjaGVja19zdGRfZXZlbnRzX3dv
cmssIHJ2cG11X2NoZWNrX3N0ZF9ldmVudHMpOwo+Cj4gIHN0YXRpYyBzc2l6ZV90IHJ2cG11X2Zv
cm1hdF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+IEBAIC03
MTIsNiArNzE3LDkgQEAgc3RhdGljIGludCBydnBtdV9zYmlfY3RyX2dldF9pZHgoc3RydWN0IHBl
cmZfZXZlbnQgKmV2ZW50KQo+Cj4gICAgICAgICBjZmxhZ3MgPSBydnBtdV9zYmlfZ2V0X2ZpbHRl
cl9mbGFncyhldmVudCk7Cj4KPiArICAgICAgIGlmICghcmlzY3ZfcG11X3NiaV9hdmFpbGFibGUo
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKwo+ICAgICAgICAgLyoKPiAg
ICAgICAgICAqIEluIGxlZ2FjeSBtb2RlLCB3ZSBoYXZlIHRvIGZvcmNlIHRoZSBmaXhlZCBjb3Vu
dGVycyBmb3IgdGhvc2UgZXZlbnRzCj4gICAgICAgICAgKiBidXQgbm90IGluIHRoZSB1c2VyIGFj
Y2VzcyBtb2RlIGFzIHdlIHdhbnQgdG8gdXNlIHRoZSBvdGhlciBjb3VudGVycwo+IEBAIC05OTks
NyArMTAwNyw3IEBAIHN0YXRpYyB1NjQgcnZwbXVfY3RyX3JlYWQoc3RydWN0IHBlcmZfZXZlbnQg
KmV2ZW50KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gdmFsOwo+ICAgICAgICAgfQo+Cj4gLSAg
ICAgICBpZiAocG11X3NiaV9pc19md19ldmVudChldmVudCkpIHsKPiArICAgICAgIGlmIChwbXVf
c2JpX2lzX2Z3X2V2ZW50KGV2ZW50KSAmJiByaXNjdl9wbXVfc2JpX2F2YWlsYWJsZSgpKSB7Cj4g
ICAgICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVf
Q09VTlRFUl9GV19SRUFELAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdjLT5p
ZHgsIDAsIDAsIDAsIDAsIDApOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0LmVycm9yKQo+IEBA
IC0yMTMyLDEyICsyMTQwLDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IHJ2cG11X2RldmluaXQodm9p
ZCkKPiAgICAgICAgIGludCByZXQ7Cj4gICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2Owo+Cj4gLSAgICAgICBpZiAoc2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigw
LCAzKSAmJgo+IC0gICAgICAgICAgIHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9QTVUpKQo+
IC0gICAgICAgICAgICAgICBzdGF0aWNfYnJhbmNoX2VuYWJsZSgmcmlzY3ZfcG11X3NiaV9hdmFp
bGFibGUpOwo+ICsgICAgICAgaWYgKHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9QTVUpKSB7
Cj4gKyAgICAgICAgICAgICAgIGlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9u
KDAsIDMpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9lbmFibGUo
JnJpc2N2X3BtdV9zYmlfYXZhaWxhYmxlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
c2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNiaV92Ml9hdmFpbGFibGUgPSB0cnVlOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDMsIDAp
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpX3YzX2F2YWlsYWJsZSA9IHRy
dWU7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPgo+IC0gICAgICAgaWYgKHNiaV9z
cGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpCj4gLSAgICAgICAgICAgICAgIHNi
aV92Ml9hdmFpbGFibGUgPSB0cnVlOwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFdlIG5lZWQg
YWxsIHRocmVlIGV4dGVuc2lvbnMgdG8gYmUgcHJlc2VudCB0byBhY2Nlc3MgdGhlIGNvdW50ZXJz
Cj4gICAgICAgICAgKiBpbiBTLW1vZGUgdmlhIFN1cGVydmlzb3IgQ291bnRlciBkZWxlZ2F0aW9u
Lgo+IEBAIC0yMTUyLDkgKzIxNjQsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBydnBtdV9kZXZpbml0
KHZvaWQpCj4gICAgICAgICBpZiAoIShyaXNjdl9wbXVfc2JpX2F2YWlsYWJsZV9ib290KCkgfHwg
cmlzY3ZfcG11X2NkZWxlZ19hdmFpbGFibGVfYm9vdCgpKSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4KPiAtICAgICAgIGlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9u
KDMsIDApKQo+IC0gICAgICAgICAgICAgICBzYmlfdjNfYXZhaWxhYmxlID0gdHJ1ZTsKPiAtCj4g
ICAgICAgICByZXQgPSBjcHVocF9zZXR1cF9zdGF0ZV9tdWx0aShDUFVIUF9BUF9QRVJGX1JJU0NW
X1NUQVJUSU5HLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInBlcmYv
cmlzY3YvcG11OnN0YXJ0aW5nIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJ2cG11X3N0YXJ0aW5nX2NwdSwgcnZwbXVfZHlpbmdfY3B1KTsKPgo+IC0tCj4gMi41My4w
LU1ldGEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
