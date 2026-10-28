Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD64660A2635
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4S9Vi3i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6jl/SPq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=toWvJ1IGMgsxi1Mj9pZ9/ohdf3zBohNUEOsnhxkKEXo=; b=R4S9Vi3iUu6eNuAcbiZgXjUzkj
	Qcw4QW02eJ4owsmE1WF9B1Xkhn+uV0MZQxLoN4WtiaAlORgPnbkjMYQIDV62ceKa3sFLAUHdXIvKs
	SoxrgAJ3ZQeHsKvKAVDvnBUGIAy1/5nVD6ZtLIe4p4XvEnbBBCMkLE2q+erFS8WbAepWDb5AeCyO+
	16MXBPqjJ0idS0+4vxF1SghMqpBCprK4w8QyPkwtJwwMXrw38o6JmBFn2SxJIjWn/eL4iD8GYBAzu
	cYk45aWQlx2XFZvi8dcDwv5d5xZ0kwq9JGySBlmbfv7rB4q1SsNqzKwhbSqj5qL4UHxW4eKPULJQG
	kCxUMIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5ov-00000007RDW-0Wpw;
	Wed, 28 Oct 2026 15:44:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5or-00000007RAj-36RZ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 15:44:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10169415e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202242; x=1793807042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
        b=y6jl/SPqlacPa8Pl+I2VVo0fS3skTiL4BTzO6Aic0eG4QGAvyq/2zHq0zco23EaWBR
         GVtW1OXK5HjL0alCphcWVLdsYFaUcGsOpfI6/n1TCOjPoOWaN8k3sf/Be/L6EhjuEflh
         akeDOYvk8FAYnmgPdCqweugZ43uCVb7K+25pbVB1WQVejiBabf4XYqE4VIUFb6ztyR/6
         PlBt2Fx2W68GTVvXyPMlNGZPutkzXtx92fEJUvm+MSN9Sbg5X5vEFRkosTY2bx1oF97N
         hOAvhoCv0IjP4echQ0GwaINIK86qfarqLMTFEXPBTgQXYO0hQ/0/kJNYo3T7ooLuutZl
         Jm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202242; x=1793807042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
        b=OSPFJtLdU0Dp1vUhJ00DCN2HvMsSY1tahmHD0GwfLLpwpo4SV8MOZud8xoSp3GCiPj
         rOIv45QumsLBRkSivU4Z42r62IDEIws+p92jIlRPthI+BFLQSAkvERo/5+VGEUsbeGfg
         MaUpqWGuRhZH83Gena+RIFeptH7ka3+zeA1c0uFhEG+Mo9ctDbkL5s5QQy4L3l5CdJoe
         qC36YggsL3kuJ/bTbzogLQIedJVhSwtCGtR5q+BNd5+gRlB3+R/pSbWcsLuk/zXBheVD
         hgE8YCBaZ6z3ftc6qJX4S1s/JP7qZW3rDMluF9jhN6c4t2GCc3H6zWGeLU5LXVL0rugs
         Jo0w==
X-Forwarded-Encrypted: i=1; AKwUvBwcNmNoRnhV6iiv8kT7D9M14XzLQVgFXog3uR0zoj3jQ1aDScRzxPcMUUOFX2FRFoIGYbyQ31Tbo4QLrA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLPGsoBYa2goa9o9v5UCZkRDPl7dhM6jAnyqHPQb47CpXuyn93D
	dvR89XPdTpZzHLBkrsf7CqFLu8H2lwtCYlBjT01vOaGmfrA3epesx7er
X-Gm-Gg: AYBFou2eoC+n0JfWMPJ2cQTDa7zgHEYn/wC9tiPwvC7VxwD3gJM61O+0Bu3t5cS/1TF
	ZKks0BbHrjUMwz/XmCXWIAdw+bJX4exGixcmnTiIguTE8z0VBRnwVECKWDNfgNk3GSQWwDB1Qbi
	Vrm4w+YxniCY+0K/0XuRKKz3lm8H1Pfc2zuP/EelQvnj4pzdshcjZfb/a7VamYdCPBdK/tVix9k
	eq1vYMYHmPVVcCNrrCtVbLEH6vznbv7ytWNed6NorIqy5iqlYVbe4i13aguFD+MtZ3YhfaMtg/F
	Y1hxdlHAEd65TuMAqVcTENC/qyNHMtxERP7tSx8Q7hG2Up8A6D6+nz1dsr3BT0LsG4dwNKQ5UKV
	Iq/rXBqcXomI9ajlTj/mwC3iGvSRczUnE+qsqBviTVljnkad45X/PjpYBpi+J/IJdRUO1ABa85y
	c8j4kLjt9EzMBHvpt1/x/WUi9g8aZJu4Vpl1TEuF9yGA8ssjuJabNWqjn3gUjtrCdASPU7Sl+e3
	j4MalNDxwNLFcL4Py2g8MPR2n6v+w0NRVb9tWEiD9yA/yv4+Ozwuo7wGyP6D9SoGY564PXrJ/y+
	pByRcZEcCph7zGXeRO8SY3RNgui2XWTPmkN2F+Lm3mS4Kfinh74p9HFj7P0neoNkfg==
X-Received: by 2002:a05:600c:a48:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4a9661ab4e9mr59192805e9.11.1793202242297;
        Wed, 28 Oct 2026 08:44:02 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:00 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/4] arm64/gcs: release GCS on failed fork
Date: Wed, 28 Oct 2026 12:43:12 -0300
Message-ID: <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084405_801479_CCDF150E 
X-CRM114-Status: GOOD (  11.99  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Y29weV90aHJlYWQoKSBjYW4gbWFwIGEgQ0xPTkVfVk0gR0NTIGFuZCBzdGlsbCByZXR1cm4gMC4g
QSBsYXRlcgpjb3B5X3Byb2Nlc3MoKSBmYWlsdXJlIGNhbGxzIGV4aXRfdGhyZWFkKCksIGJ1dCBh
cm02NCBkaWQgbm90CmltcGxlbWVudCBpdCwgc28gdGhlIFZNQSBzdGF5ZWQgaW4gdGhlIHBhcmVu
dCdzIG1tLiBXaXJlCkhBVkVfRVhJVF9USFJFQUQgdG8gZ2NzX2ZyZWUoKS4KCng4NiBhbHJlYWR5
IGRvZXMgdGhpcyB2aWEgZXhpdF90aHJlYWQoKSAtPiBzaHN0a19mcmVlKCkuIFRoZSBzZXBhcmF0
ZQp4ODYgVExTIGxlYWsgaXMgZGlmZmVyZW50OiBjb3B5X3RocmVhZCgpIGl0c2VsZiBmYWlscyBh
ZnRlciB0aGUKYWxsb2MsIHNvIGNvcHlfcHJvY2VzcygpIHNraXBzIGV4aXRfdGhyZWFkKCkuCgph
cmdzLT5mbiB0YXNrcyBpbmhlcml0IEdDUyB0cmFja2luZyB3aXRob3V0IGFsbG9jYXRpbmc7IGNs
ZWFyIGl0IHNvCmEgZmFpbGVkIENMT05FX1ZNIGNvcHlfcHJvY2VzcygpIGNhbm5vdCBnY3NfZnJl
ZSgpIHRoZSBjYWxsZXIncwpzdGFjay4gS2VlcCB0aGF0IGhlbHBlciBpbiBwcm9jZXNzLmMgd2l0
aCB0aGUgb3RoZXIgZm9yayBoZWxwZXJzLgoKRml4ZXM6IDUwNjQ5NmJjYmI0MiAoImFybTY0L2dj
czogRW5zdXJlIHRoYXQgbmV3IHRocmVhZHMgaGF2ZSBhIEdDUyIpCkNjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCkNjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+CkFzc2lzdGVkLWJ5
OiBMTE0KU2lnbmVkLW9mZi1ieTogSXbDoW4gRXplcXVpZWwgUm9kcmlndWV6IDxpdmFucndjbTI1
QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgfCAgMSArCiBhcmNo
L2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcg
Yi9hcmNoL2FybTY0L0tjb25maWcKaW5kZXggY2ZlZjIyYWVlNzA5Li4zMDEwY2VkNGI0ZjIgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtNjQvS2NvbmZpZworKysgYi9hcmNoL2FybTY0L0tjb25maWcKQEAg
LTE3Nyw2ICsxNzcsNyBAQCBjb25maWcgQVJNNjQKIAlzZWxlY3QgSEFWRV9BUk1fU01DQ0MKIAlz
ZWxlY3QgSEFWRV9BU01fTU9EVkVSU0lPTlMKIAlzZWxlY3QgSEFWRV9FQlBGX0pJVAorCXNlbGVj
dCBIQVZFX0VYSVRfVEhSRUFECiAJc2VsZWN0IEhBVkVfQ19SRUNPUkRNQ09VTlQKIAlzZWxlY3Qg
SEFWRV9DTVBYQ0hHX0RPVUJMRQogCXNlbGVjdCBIQVZFX0NNUFhDSEdfTE9DQUwKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nl
c3MuYwppbmRleCA1ODFmODBlOWI5YjcuLmQxNzE3MmU2MGFjYiAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwpA
QCAtMzIwLDYgKzMyMCwxMyBAQCBzdGF0aWMgaW50IGNvcHlfdGhyZWFkX2djcyhzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnAsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lkIGdjc19yZXNldF90aHJl
YWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQoreworCXRhc2stPnRocmVhZC5nY3NfYmFzZSA9
IDA7CisJdGFzay0+dGhyZWFkLmdjc19zaXplID0gMDsKKwl0YXNrLT50aHJlYWQuZ2NzcHJfZWww
ID0gMDsKK30KKwogI2Vsc2UKIAogc3RhdGljIHZvaWQgZmx1c2hfZ2NzKHZvaWQpIHsgfQpAQCAt
MzI4LDYgKzMzNSw3IEBAIHN0YXRpYyBpbnQgY29weV90aHJlYWRfZ2NzKHN0cnVjdCB0YXNrX3N0
cnVjdCAqcCwKIHsKIAlyZXR1cm4gMDsKIH0KK3N0YXRpYyB2b2lkIGdjc19yZXNldF90aHJlYWQo
c3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKSB7IH0KIAogI2VuZGlmCiAKQEAgLTM0MSw2ICszNDks
MTIgQEAgdm9pZCBmbHVzaF90aHJlYWQodm9pZCkKIAlmbHVzaF9nY3MoKTsKIH0KIAordm9pZCBl
eGl0X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKK3sKKwkvKiBGYWlsZWQgZm9yayBh
ZnRlciBjb3B5X3RocmVhZCgpOyBkZWFjdGl2YXRlX21tKCkgZG9lcyBub3QgcnVuLiAqLworCWdj
c19mcmVlKHRzayk7Cit9CisKIHZvaWQgYXJjaF9yZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0
YXNrX3N0cnVjdCAqdHNrKQogewogCWZwc2ltZF9yZWxlYXNlX3Rhc2sodHNrKTsKQEAgLTUwMyw2
ICs1MTcsOCBAQCBpbnQgY29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBz
dHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCiAKIAkJcC0+dGhyZWFkLmNwdV9jb250ZXh0
LngxOSA9ICh1bnNpZ25lZCBsb25nKWFyZ3MtPmZuOwogCQlwLT50aHJlYWQuY3B1X2NvbnRleHQu
eDIwID0gKHVuc2lnbmVkIGxvbmcpYXJncy0+Zm5fYXJnOworCQkvKiBObyB1c2VyIEdDUyBhbGxv
YyBoZXJlOyBkcm9wIGluaGVyaXRlZCB0cmFja2luZyBmb3IgQ0xPTkVfVk0uICovCisJCWdjc19y
ZXNldF90aHJlYWQocCk7CiAKIAkJaWYgKHN5c3RlbV9zdXBwb3J0c19wb2UoKSkKIAkJCXAtPnRo
cmVhZC5wb3JfZWwwID0gUE9SX0VMMF9JTklUOwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
