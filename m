Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3B0FF885A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGrAQhcMOjoK5JXevrmEvVrAWPNSsLIMrOXV3r+JJ7M=; b=ukFxyQhD1vniVQ
	mR1hyOJ4/xn2n/6nulicUepApXYpDiOYgUDZlVf2+az/VULlzLnpDJkkpyfbsJfgmKjK90zvKLkHa
	duF7kvpyqKuEsGJlHs2pIoGGrzaXEMnS2bxT4hndHdxo8eiYUW/T8ZyFt0eTIiJw5AordwxTTuPYY
	RVmNOlM2aDomqsFTBMOyT/dBsB0qbeSnPwVHxzhEtRYBlkWbpuV8d9Ehjardi41cNJGA8/ZH0xvy+
	qhKt8p7KHF4cHFZ6wHZ2oOZAAs7NdV2mDmIbYPe2rYKLqd+1zit4qZhKtCOO75NlfnUQb8gSbyo9g
	EN4/O2w4V5UkYrThjPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK99s-0000000FHCJ-0i1k;
	Tue, 05 May 2026 06:21:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK99p-0000000FHAj-1eqy
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 06:21:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso3749014b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 23:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777962084; x=1778566884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4znkv+W5vuAGwYDPrkKlG4HbKRGYXv2X7CusMf1hFi8=;
        b=cAG2V6mVJLsaWuDdDvsRIkFVUTgmow/klcTV2nTBgKD/dKe1zehatfIq6FpaQg3TvJ
         RasxzNwg4mJVbsiYq+es7dc+KJdw8ZvsCFyjUANx/b8Jqi3k9huect9d9u5Gzj+tUn0/
         G17+JAVXsDN574XCiQpu1G7JMcM7pjOVeZDV7U5SxTsb09dz13MwUlTnc17UHu/0NW4u
         0sdAjYTATBSC/PiHPKre/GJZNumF0GOw2xcU0YWYatS9uD4W6w//+drCm09xqfY467ez
         oLiMg28HH2yPNL6eGGrCaaqHwPWVViYcuW2C0iE0/EL42P1C5bHCGN0pV4va8eCGaoXv
         HOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777962084; x=1778566884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4znkv+W5vuAGwYDPrkKlG4HbKRGYXv2X7CusMf1hFi8=;
        b=tHi0dRNLHwa+/c1MWhygFXdjnIqccsnEi0NDLZJDzfONOgBWpmSfOrx2E39kyocfvP
         u0nb3GlFtmfVO7gvRLibqkWfZcmoiEbKVHzIj/i2nxT6ceXluzNe2pLMVN0xgSBSn9yn
         4G9mcFTkkB3e7x2NrCfFtmWvU1TE/iTqCEXYzKPpwLtE3UiH7J8LgSvcfCw9mMwHi53K
         i+po1Itgs42VwYOS4TSRVTvqBJAphLjfGuZdX/so9wfu4qYdd4qNhmp7lWrkPKXrgeoY
         lR1W/rnwNlcxPyQNrD9brWg0kx6LtTZS1qcLpeeaYQ3A+uRWlKFthkbX7yeJWNKXJqI/
         buYg==
X-Forwarded-Encrypted: i=1; AFNElJ+GoC1i1jY7ps/LSubKJ7DWx7ICUijFeKfUSjrLnXM9DQw+lzHLcON6v/lfEC6Mm3wi1OtYmiz/DfYUOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjQ/MlJkvilyVZNEBiy89YP/Hq6emzYWV41OZWH8cIlcENxcf9
	SftiRk3Ft288CdyosDmKJ1M/OJfTezm1XSkySexJpKiUyuKZDZS4EWR5DT4BUyk/g5I=
X-Gm-Gg: AeBDiesFm2DiysYSWTakPix0/Cb99KCCx3PfvQtAMYAkloPOtVFVoo4IVEko95rwt9q
	AgTXzJcbtehF5rf27NaupPQve2JZ6jve8G3PXdGLLYkpitK3/b44DM91io16kFaYkml1XhXA6q8
	ogIrmKcbCZR/AdBVWYgMw4widPpWLVAfQ+hHWKkEepF9QmpKXYFCngS1gepxZzItbas7xTPYzQ3
	vbih+WsdpH4SnClWV2JcDltdulbQg5sBxpcjRxJdAgackXO5kQHMpaITjvTyYYB2IBLhKJfx5Tu
	Ii2gRMcInXKa8lzhd66dPK9HyMpBx081aQgq23MkYyNEDYqXikFapa/+zKH+H+ekcIVO2GURsNA
	PVpdUtyNAZiGu6IMmU9nm5PGtauy0cXZddIRTkTR7wDQNS3hpEPqgBJY313fkKYWaYn5zGuMR4Q
	L6tUgfpfrzILZZi2OHFXuZ0V+Zgvs5GDvkLaov3eknwoVGQGlNvXoE/CGz+oKloCIQ
X-Received: by 2002:a05:6a00:14ca:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-8352d1bf331mr13120000b3a.18.1777962084168;
        Mon, 04 May 2026 23:21:24 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c10sm880738b3a.37.2026.05.04.23.21.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 May 2026 23:21:23 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 3/3] riscv: store percpu offset into thread_info
Date: Tue,  5 May 2026 14:20:26 +0800
Message-Id: <20260505062026.91724-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260505062026.91724-1-cuiyunhui@bytedance.com>
References: <20260505062026.91724-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_232125_443128_2D816A48 
X-CRM114-Status: GOOD (  16.37  )
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

T3JpZ2luYWxseSB3ZSBwbGFubmVkIHRvIGFkZCBhIHJlZ2lzdGVyIGZvciB0aGUgcGVyY3B1IG9m
ZnNldCwKd2hpY2ggd291bGQgc3BlZWQgdXAgcGVyY3B1IHZhcmlhYmxlIFIvVyBhbmQgcmVkdWNl
IGFjY2VzcwppbnN0cnVjdGlvbnMuIEFmdGVyIGRpc2N1c3Npb24gWzFdLCBpdOKAmXMgbm93IHN0
b3JlZCBpbiB0aHJlYWRfaW5mby4KClsxXSBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gt
cHJpdmlsZWdlZC90b3BpYy9yaXNjX3ZfdGVjaF9hcmNoX3Jldmlldy8xMTM0Mzc1NTM/cGFnZT0y
CgpTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oICAgICAgICAgfCA2ICstLS0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaCAgICAgIHwgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N3aXRjaF90by5oICAgfCA4ICsrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3RocmVhZF9pbmZvLmggfCAzICsrLQogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAg
ICAgIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICAgICAgICAgfCA3ICsrKysr
KysKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICB8IDkgKy0tLS0tLS0tCiA3
IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2FzbS5oCmluZGV4IGU5ZThiYTgzZTYzMmYuLjEzN2E0OTQ4ODMyNWUgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hc20uaApAQCAtOTEsMTEgKzkxLDcgQEAKIAogI2lmZGVmIENPTkZJR19TTVAKIC5tYWNybyBh
c21fcGVyX2NwdSBkc3Qgc3ltIHRtcAotCWx3ICAgIFx0bXAsIFRBU0tfVElfQ1BVX05VTSh0cCkK
LQlzbGxpICBcdG1wLCBcdG1wLCBSSVNDVl9MR1BUUgotCWxhICAgIFxkc3QsIF9fcGVyX2NwdV9v
ZmZzZXQKLQlhZGQgICBcZHN0LCBcZHN0LCBcdG1wCi0JUkVHX0wgXHRtcCwgMChcZHN0KQorCVJF
R19MIFx0bXAsIFRBU0tfVElfUENQVV9PRkZTRVQodHApCiAJbGEgICAgXGRzdCwgXHN5bQogCWFk
ZCAgIFxkc3QsIFxkc3QsIFx0bXAKIC5lbmRtCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BlcmNwdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaAppbmRleCAz
YjI2ZmU0NWU3MGY0Li44NDYxMmQ2NzIxMDVkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BlcmNwdS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyY3B1LmgKQEAg
LTcsNyArNyw5IEBACiAKICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmg+CiAjaW5j
bHVkZSA8YXNtL2NwdWZlYXR1cmUtbWFjcm9zLmg+CisjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4K
ICNpbmNsdWRlIDxhc20vaHdjYXAuaD4KKyNpbmNsdWRlIDxhc20vdGhyZWFkX2luZm8uaD4KIAog
I2RlZmluZSBQRVJDUFVfUldfT1BTKHN6KQkJCQkJCVwKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQg
bG9uZyBfX3BlcmNwdV9yZWFkXyMjc3oodm9pZCAqcHRyKQkJXApAQCAtMjc1LDYgKzI3Nyw4IEBA
IF9wY3BfcHJvdGVjdF9yZXR1cm4oX19wZXJjcHVfYWRkX3JldHVybl9hbW9fY2FzZV82NCwgcGNw
LCB2YWwpCiB9KQogI2VuZGlmCiAKKyNkZWZpbmUgX19teV9jcHVfb2Zmc2V0ICgoKHN0cnVjdCB0
aHJlYWRfaW5mbyAqKWN1cnJlbnQpLT5wY3B1X29mZnNldCkKKwogI2luY2x1ZGUgPGFzbS1nZW5l
cmljL3BlcmNwdS5oPgogCiAjZW5kaWYgLyogX19BU01fUEVSQ1BVX0ggKi8KZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3N3aXRjaF90by5oCmluZGV4IDBlNzFlYjgyZjkyMGMuLjczM2I2Y2QzMDZlNDAgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaApAQCAtODgsNiArODgsMTMgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIF9fc3dpdGNoX3RvX2VudmNmZyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKm5leHQpCiAJCQk6
OiAiciIgKG5leHQtPnRocmVhZC5lbnZjZmcpIDogIm1lbW9yeSIpOwogfQogCitzdGF0aWMgaW5s
aW5lIHZvaWQgX19zd2l0Y2hfdG9fcGNwdV9vZmZzZXQoc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0
KQoreworI2lmZGVmIENPTkZJR19TTVAKKwluZXh0LT50aHJlYWRfaW5mby5wY3B1X29mZnNldCA9
IF9fbXlfY3B1X29mZnNldDsKKyNlbmRpZgorfQorCiBleHRlcm4gc3RydWN0IHRhc2tfc3RydWN0
ICpfX3N3aXRjaF90byhzdHJ1Y3QgdGFza19zdHJ1Y3QgKiwKIAkJCQkgICAgICAgc3RydWN0IHRh
c2tfc3RydWN0ICopOwogCkBAIC0xMjIsNiArMTI5LDcgQEAgZG8gewkJCQkJCQlcCiAJaWYgKHN3
aXRjaF90b19zaG91bGRfZmx1c2hfaWNhY2hlKF9fbmV4dCkpCVwKIAkJbG9jYWxfZmx1c2hfaWNh
Y2hlX2FsbCgpOwkJXAogCV9fc3dpdGNoX3RvX2VudmNmZyhfX25leHQpOwkJCVwKKwlfX3N3aXRj
aF90b19wY3B1X29mZnNldChfX25leHQpOwkJXAogCSgobGFzdCkgPSBfX3N3aXRjaF90byhfX3By
ZXYsIF9fbmV4dCkpOwkJXAogfSB3aGlsZSAoMCkKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRf
aW5mby5oCmluZGV4IDU1MDE5ZmRmYTllY2EuLmYxMGJhNjJiNjEwMTYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3RocmVhZF9pbmZvLmgKQEAgLTUzLDYgKzUzLDcgQEAKIHN0cnVjdCB0aHJlYWRfaW5m
byB7CiAJdW5zaWduZWQgbG9uZwkJZmxhZ3M7CQkvKiBsb3cgbGV2ZWwgZmxhZ3MgKi8KIAlpbnQg
ICAgICAgICAgICAgICAgICAgICBwcmVlbXB0X2NvdW50OyAgLyogMD0+cHJlZW1wdGlibGUsIDww
PT5CVUcgKi8KKwlpbnQJCQljcHU7CiAJLyoKIAkgKiBUaGVzZSBzdGFjayBwb2ludGVycyBhcmUg
b3ZlcndyaXR0ZW4gb24gZXZlcnkgc3lzdGVtIGNhbGwgb3IKIAkgKiBleGNlcHRpb24uICBTUCBp
cyBhbHNvIHNhdmVkIHRvIHRoZSBzdGFjayBpdCBjYW4gYmUgcmVjb3ZlcmVkIHdoZW4KQEAgLTYw
LDggKzYxLDggQEAgc3RydWN0IHRocmVhZF9pbmZvIHsKIAkgKi8KIAlsb25nCQkJa2VybmVsX3Nw
OwkvKiBLZXJuZWwgc3RhY2sgcG9pbnRlciAqLwogCWxvbmcJCQl1c2VyX3NwOwkvKiBVc2VyIHN0
YWNrIHBvaW50ZXIgKi8KLQlpbnQJCQljcHU7CiAJdW5zaWduZWQgbG9uZwkJc3lzY2FsbF93b3Jr
OwkvKiBTWVNDQUxMX1dPUktfIGZsYWdzICovCisJdW5zaWduZWQgbG9uZwkJcGNwdV9vZmZzZXQ7
CiAjaWZkZWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNLCiAJdm9pZAkJCSpzY3NfYmFzZTsKIAl2
b2lkCQkJKnNjc19zcDsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCmluZGV4IGFmODI3NDQ4YTYwOWUu
LmZiZjUzYjY2YjBlMDYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwpAQCAtMzgsNiArMzgsNyBA
QCB2b2lkIGFzbV9vZmZzZXRzKHZvaWQpCiAJT0ZGU0VUKFRBU0tfVEhSRUFEX1NVTSwgdGFza19z
dHJ1Y3QsIHRocmVhZC5zdW0pOwogCiAJT0ZGU0VUKFRBU0tfVElfQ1BVLCB0YXNrX3N0cnVjdCwg
dGhyZWFkX2luZm8uY3B1KTsKKwlPRkZTRVQoVEFTS19USV9QQ1BVX09GRlNFVCwgdGFza19zdHJ1
Y3QsIHRocmVhZF9pbmZvLnBjcHVfb2Zmc2V0KTsKIAlPRkZTRVQoVEFTS19USV9QUkVFTVBUX0NP
VU5ULCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8ucHJlZW1wdF9jb3VudCk7CiAJT0ZGU0VUKFRB
U0tfVElfS0VSTkVMX1NQLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8ua2VybmVsX3NwKTsKIAlP
RkZTRVQoVEFTS19USV9VU0VSX1NQLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8udXNlcl9zcCk7
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zbXBib290LmMKaW5kZXggOGI2Mjg1ODBmZTExOC4uNDE0NjNhODQwMGY2YyAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3NtcGJvb3QuYwpAQCAtMjA5LDYgKzIwOSwxMSBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQgaW50
IGNwdSwgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKIH0KICNlbmRpZgogCit2b2lkIF9faW5p
dCBzbXBfcHJlcGFyZV9ib290X2NwdSh2b2lkKQoreworCV9fbXlfY3B1X29mZnNldCA9IHBlcl9j
cHVfb2Zmc2V0KHNtcF9wcm9jZXNzb3JfaWQoKSk7Cit9CisKIHZvaWQgX19pbml0IHNtcF9jcHVz
X2RvbmUodW5zaWduZWQgaW50IG1heF9jcHVzKQogewogfQpAQCAtMjM0LDYgKzIzOSw4IEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQogCW1tZ3JhYihtbSk7CiAJ
Y3VycmVudC0+YWN0aXZlX21tID0gbW07CiAKKwlfX215X2NwdV9vZmZzZXQgPSBwZXJfY3B1X29m
ZnNldChzbXBfcHJvY2Vzc29yX2lkKCkpOworCiAjaWZkZWYgQ09ORklHX0hPVFBMVUdfUEFSQUxM
RUwKIAljcHVocF9hcF9zeW5jX2FsaXZlKCk7CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
CmluZGV4IDJmMTEwOWRiZjEwNWIuLjE3N2MxOTIxNjAxM2UgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYwpAQCAtMTM5NSwxNSArMTM5NSw4IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBz
dHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCQkJaWYg
KHJkICE9IHJzKQogCQkJCWVtaXRfbXYocmQsIHJzLCBjdHgpOwogI2lmZGVmIENPTkZJR19TTVAK
LQkJCS8qIExvYWQgY3VycmVudCBDUFUgbnVtYmVyIGluIFQxICovCi0JCQllbWl0X2x3KFJWX1JF
R19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLAorCQkJZW1pdF9sZChSVl9S
RUdfVDEsIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgcGNwdV9vZmZzZXQpLAogCQkJCVJW
X1JFR19UUCwgY3R4KTsKLQkJCS8qIExvYWQgYWRkcmVzcyBvZiBfX3Blcl9jcHVfb2Zmc2V0IGFy
cmF5IGluIFQyICovCi0JCQllbWl0X2FkZHIoUlZfUkVHX1QyLCAodTY0KSZfX3Blcl9jcHVfb2Zm
c2V0LCBleHRyYV9wYXNzLCBjdHgpOwotCQkJLyogR2V0IGFkZHJlc3Mgb2YgX19wZXJfY3B1X29m
ZnNldFtjcHVdIGluIFQxICovCi0JCQllbWl0X3NoM2FkZChSVl9SRUdfVDEsIFJWX1JFR19UMSwg
UlZfUkVHX1QyLCBjdHgpOwotCQkJLyogTG9hZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gaW4gVDEg
Ki8KLQkJCWVtaXRfbGQoUlZfUkVHX1QxLCAwLCBSVl9SRUdfVDEsIGN0eCk7CiAJCQkvKiBBZGQg
dGhlIG9mZnNldCB0byBSZCAqLwogCQkJZW1pdF9hZGQocmQsIHJkLCBSVl9SRUdfVDEsIGN0eCk7
CiAjZW5kaWYKLS0gCjIuMzkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
