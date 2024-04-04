Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E64CD1296
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0H1YMpvfgz8mcZwaDF3k9wWu2nNHMaY+wgxC/ENBdg=; b=ej4wIebd9vNOnO
	h91FykxGDq9y1eLLM7XlRXhzbJamRkD0QxMIi2So/INf15RUUH0eutin/utLW/i6dx8nZNnFl4DLd
	8AvLYzDyNol0+jEx/Ao9wULpcYkGI2D6a/+a0iMyRZbdWeTez2ihezvEXBgLuq5qJTp3mlI3S77ZG
	sApOuPPCJwkhzS9uccBbnxyIT4z+trKuhj4/Iy7KRtGma5PoQ/ch9+6wKFxM3rPokn7OoVckCUIA8
	wPYkiMVy56zrQ+4M1uCxe8EOC96KX9KJNSlSfrZhITT8xKQs+j4OmcC0h59GzR+TS7Rm47DtUnC5W
	EA60FK/MDubfa+/F+1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLUZ-00000002PF7-0YAo;
	Thu, 04 Apr 2024 11:42:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLUW-00000002PCt-0QjZ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:42:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4162ad25c23so3116215e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712230965; x=1712835765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBpxRZ3MJIcd7NAv7MGq7cr29bRjoQSHr/33JsmvHrE=;
        b=gn/T8myNUF1JSyGq4Nla1jursbElfyuK+oGqPlHNLwsrzhhywDxqLhEGAvNl6esrZj
         dLjNRCBaJUBb216Wzlh5STCb8AO3xgPHyJrWlf1RyqtWHiK01iWX5ikfq0PbMrZWk3gG
         6rhcr7WhwPIjycictD+p6QrQaBxp+30BGYx5kCPUOJs4z/2cyAZno1LmRxvCpntp6wvf
         5Pqhr99O7vvcJEPW+PH4lJC9TE4DPnvzhTnRfhUhBpqjHj0daPwMjQO6P2fTN4WLpEB1
         61q466FzpYA/uHjAbr5aUinVqQR1aQ1/fYXHsGNXeITQsYVdt5Q5q9iyoutzRpEjzdlt
         d0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230965; x=1712835765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBpxRZ3MJIcd7NAv7MGq7cr29bRjoQSHr/33JsmvHrE=;
        b=OlHKLSGKCgwMfL1BaQH9GWDgbXqyhIlQC0f+Ta/YL9O153NVlRWEAgsb9CVUda6EG5
         /VzobWDPGOig5qdDN0KgAmq9fYTwSMIa2XqskkQqV7UAmehwo+r/8L5apnhFZz+rr3lZ
         OZtiLD4KvFlMmjpb11AoUDMrPUfkuTRlRQMIjAel+L23OyRhMpTGHjZ06t/XZ7o2yuf8
         +g5e5ObdqTNYkTN8xvY5svgpW716PiaAUGHpnjraCgrfDyWonbmgs9wUdCAPlOC5PDo+
         +NAD7/WxfgE9BExRWSgoKHwYgw/0/g5MW/w4i+PR9ufLRpsuexir7S48uDkQhDwirpJT
         fkzA==
X-Forwarded-Encrypted: i=1; AJvYcCX/6nKcG/0R85US3GgocCnd6Q9+gn85ihNW+CpPi41P3SdHT+ooFl4a93DaPY7YlI+LVI98F55aNjIrJPQh4YeWuR3MIIfY2hXaMjkCOZPc
X-Gm-Message-State: AOJu0YxquN02zp7WvdzcOTZzs+d/O3yonKmTKWGpfVGSx8+8pLZLuggC
	RN15YJg+9c3IGX3VVhDV1IJ5rTDbIwjb7xcbG3MravJGarws3diO
X-Google-Smtp-Source: AGHT+IFAPWMxNe4GVfIC6LRICc1d9X5xANtb8PN3uV2cg2QAC3WE59MFFVdGIL+Hd3zDV06z5yaLfw==
X-Received: by 2002:a05:600c:287:b0:414:6865:b5bc with SMTP id 7-20020a05600c028700b004146865b5bcmr1829278wmk.28.1712230965536;
        Thu, 04 Apr 2024 04:42:45 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c4f9100b0041624540918sm2438600wmq.9.2024.04.04.04.42.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2024 04:42:45 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huaweicloud.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v4 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
Date: Thu,  4 Apr 2024 11:42:03 +0000
Message-Id: <20240404114203.105970-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404114203.105970-1-puranjay12@gmail.com>
References: <20240404114203.105970-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_044248_191660_456026BE 
X-CRM114-Status: GOOD (  12.38  )
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

TExWTSBnZW5lcmF0ZXMgYnBmX2FkZHJfc3BhY2VfY2FzdCBpbnN0cnVjdGlvbiB3aGlsZSB0cmFu
c2xhdGluZwpwb2ludGVycyBiZXR3ZWVuIG5hdGl2ZSAoemVybykgYWRkcmVzcyBzcGFjZSBhbmQK
X19hdHRyaWJ1dGVfXygoYWRkcmVzc19zcGFjZShOKSkpLiBUaGUgYWRkcl9zcGFjZT0wIGlzIHJl
c2VydmVkIGFzCmJwZl9hcmVuYSBhZGRyZXNzIHNwYWNlLgoKclkgPSBhZGRyX3NwYWNlX2Nhc3Qo
clgsIDAsIDEpIGlzIHByb2Nlc3NlZCBieSB0aGUgdmVyaWZpZXIgYW5kCmNvbnZlcnRlZCB0byBu
b3JtYWwgMzItYml0IG1vdmU6IHdYID0gd1kKCnJZID0gYWRkcl9zcGFjZV9jYXN0KHJYLCAxLCAw
KSBoYXMgdG8gYmUgY29udmVydGVkIGJ5IEpJVC4KClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgpUZXN0ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5j
b20+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgpSZXZpZXdlZC1i
eTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkg
TW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQu
aCAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMTQgKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jICAgfCAgMSArCiAzIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25l
dC9icGZfaml0LmggYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKaW5kZXggOGE0N2RhMDhkZDlj
Li41ZmMzNzRlZDk4ZWEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAorKysg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKQEAgLTgyLDYgKzgyLDcgQEAgc3RydWN0IHJ2X2pp
dF9jb250ZXh0IHsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCWludCBzdGFja19zaXplOwogCXU2
NCBhcmVuYV92bV9zdGFydDsKKwl1NjQgdXNlcl92bV9zdGFydDsKIH07CiAKIC8qIENvbnZlcnQg
ZnJvbSBuaW5zbnMgdG8gYnl0ZXMuICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwppbmRleCBhNGM4
ZTFlNmMxZTIuLjE1ZTQ4MmYyYzY1NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYworKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCkBAIC0xMDgx
LDYgKzEwODEsMTUgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBicGZfaW5z
biAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgsCiAJLyogZHN0ID0gc3JjICovCiAJ
Y2FzZSBCUEZfQUxVIHwgQlBGX01PViB8IEJQRl9YOgogCWNhc2UgQlBGX0FMVTY0IHwgQlBGX01P
ViB8IEJQRl9YOgorCQlpZiAoaW5zbl9pc19jYXN0X3VzZXIoaW5zbikpIHsKKwkJCWVtaXRfbXYo
UlZfUkVHX1QxLCBycywgY3R4KTsKKwkJCWVtaXRfemV4dHcoUlZfUkVHX1QxLCBSVl9SRUdfVDEs
IGN0eCk7CisJCQllbWl0X2ltbShyZCwgKGN0eC0+dXNlcl92bV9zdGFydCA+PiAzMikgPDwgMzIs
IGN0eCk7CisJCQllbWl0KHJ2X2JlcShSVl9SRUdfVDEsIFJWX1JFR19aRVJPLCA0KSwgY3R4KTsK
KwkJCWVtaXRfb3IoUlZfUkVHX1QxLCByZCwgUlZfUkVHX1QxLCBjdHgpOworCQkJZW1pdF9tdihy
ZCwgUlZfUkVHX1QxLCBjdHgpOworCQkJYnJlYWs7CisJCX0KIAkJaWYgKGltbSA9PSAxKSB7CiAJ
CQkvKiBTcGVjaWFsIG1vdjMyIGZvciB6ZXh0ICovCiAJCQllbWl0X3pleHR3KHJkLCByZCwgY3R4
KTsKQEAgLTIwMjQsMyArMjAzMyw4IEBAIGJvb2wgYnBmX2ppdF9zdXBwb3J0c19wdHJfeGNoZyh2
b2lkKQogewogCXJldHVybiB0cnVlOwogfQorCitib29sIGJwZl9qaXRfc3VwcG9ydHNfYXJlbmEo
dm9pZCkKK3sKKwlyZXR1cm4gdHJ1ZTsKK30KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29yZS5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKaW5kZXggOWFiNzM5
YjlmOWEyLi44YTY5ZDZkODFlMzIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29yZS5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCkBAIC04MSw2ICs4MSw3
IEBAIHN0cnVjdCBicGZfcHJvZyAqYnBmX2ludF9qaXRfY29tcGlsZShzdHJ1Y3QgYnBmX3Byb2cg
KnByb2cpCiAJfQogCiAJY3R4LT5hcmVuYV92bV9zdGFydCA9IGJwZl9hcmVuYV9nZXRfa2Vybl92
bV9zdGFydChwcm9nLT5hdXgtPmFyZW5hKTsKKwljdHgtPnVzZXJfdm1fc3RhcnQgPSBicGZfYXJl
bmFfZ2V0X3VzZXJfdm1fc3RhcnQocHJvZy0+YXV4LT5hcmVuYSk7CiAJY3R4LT5wcm9nID0gcHJv
ZzsKIAljdHgtPm9mZnNldCA9IGtjYWxsb2MocHJvZy0+bGVuLCBzaXplb2YoaW50KSwgR0ZQX0tF
Uk5FTCk7CiAJaWYgKCFjdHgtPm9mZnNldCkgewotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
