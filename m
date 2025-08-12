Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A906CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VlHPW9iD9vcwAXIskB5W9KNMxbi24ztppd7agGWHnc=; b=bVGNRFrv/X/dCg
	y6un8DiUAxqMbrJotS8SBLNBC8n/gliyR3ljWVolJcEePo/jn+HEVdXg54xDRN9X9R06uWp9ed4n2
	+XpCmcfnLPzxpHJ7AkNmNM/oPMqMYv8Tz6Kpixa4a/ekddgL7q+9Ybq6LLuEaLAvxCLs5Ny0xlteg
	79GKtjxmC7g9M2S5rHIOQvG/y2c98AyE7iKqiGtx1XRVEOf7s0/vk0LkYo8wKB1Cwn736bfUJKAJN
	7zTKrpfEBSYm1SEk/WM3qemzILHDcuEa46jdf0nHV5dZSmuD2dSTcBnPsH5ObJKlUwkiSC4YICokb
	UyXT6LvBzBa+roAOAOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHz-0000000Am6A-1Iri;
	Tue, 12 Aug 2025 12:39:39 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkvU-0000000AKER-2Ffm
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:04:13 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459ddb41887so6766615e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754989451; x=1755594251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkDi9sQ4u1Zsf5AcaPzYnSO2sPwb0elGC7q2l8b77oI=;
        b=XMJ4X71GIBB7gEJ9WvoblSzPo51mq2BjlFMRL/8Bsa9ka+n2xHa9C1ry4+y84Qw1Tn
         ZFQ3eUfx1M/M46Ti7fx7fmgeqvHCYOsxbiqAgf5139ou3cPj2R7/q/6iRzKS+RbQGN/J
         hGNlKYOaxvG4XT/1f0oju3/k4r9zGh30urrrccvVD59f6sIAVF7b0qpymde6xDhTFdlN
         ucP1BNDAuOAbx+/rSS12bSvZhbcYGPHDgap447P2MH1fgqtolnsOYvUMx6aD8Tsy9R9T
         PKA20sxhqQIWvyo4Mb2Sw0W0HSQhhvzlps9WU+rli6lN9Vlr/O6Zv41clOqc0u7ZnNLY
         /S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989451; x=1755594251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkDi9sQ4u1Zsf5AcaPzYnSO2sPwb0elGC7q2l8b77oI=;
        b=uP3Tk4gOfOaB30EedHM0dDqwq0+LH7hJy+KIx8KLCiqKvZn7bNs3HLknlqYjBg9fFy
         5wjLh597wbbbaCndaNg/Ei7CYVz65ZOGzYio5Dypg4AaiLfk8DEqukce8x9zKZq3CNH0
         vEPo/EQunBZIqA4vetMbnGp9NW8tFsQEaAuU25uOBr4N73KkXLVqE8S55vvkupDelEIL
         QyibAum/w19hjB1Ouhco5dYXXKHJSaSubB2dBd90peFentj0t1EiLgvvmw4ZEvvhBxcU
         Hn3SqZdk4Cdkat0SLt0aLAhz7tG51aktb3nEBx4/jFTK/U+UjVKQELRxnaJbtVq35TAz
         pPzg==
X-Forwarded-Encrypted: i=1; AJvYcCUlUOLerCyglNY/73X1Zi98Q62RDA3L2pRwttnsvYunnC6lzogrtRXVxG3cgSCSulf80UTdoIkoSW8uBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YypPYD1DdF0js0C2W/VT8TcOtTyodQZT0YGwu5mmUI7XwLOq2pq
	Ot5grb9nYpKWAib9SqCyCbZ+a3OyzZDbqMDU90b2oWnEhSyDIjtO0PwvsmAjSRDuEkw=
X-Gm-Gg: ASbGnct6TUK6DzEVe7e3EUVFDNMa6eegvg+dkaHer3E+0B4RsZGrjgOuZjYujqFGnKY
	RNg4bZNL8BaMwG1RbAdLD4Ggb3FskYDBd3loubwn6VWsczELQJqZcuAXSdx3Kyh2SaICKSmJAjM
	z5DUNw5kBD7hoGzZNxlfYVelJFauuQYeUYN7MKk7Ex+x0sOgHxxJOLQTIUzURAGjXsr/QaWK5Jg
	dkDYIifYxmNfizkxswu/E2QaG4EdAofRGdlEJ+ZI9QzxMrfurMcGrBwI1994p3Q/03UFxbevmSK
	fJS78aiAIP2qSe4Ay2W4c5wGaM4UwpCd/86vra5Ltg5qPnAClrQQ20vo8k85+jz37jDYYXsOti5
	+hAQRcFWsSWO+Bf6wXv1Dty/HCFhAFw==
X-Google-Smtp-Source: AGHT+IFBefRRbVz8mjWqcsAPH9QQgYekCVsZTS4QORs3XTzsM/mOl+JX5+dSUj2YaHIFPPZ1EW6gKQ==
X-Received: by 2002:a05:600c:608c:b0:458:a753:f3a1 with SMTP id 5b1f17b1804b1-45a1404e5b0mr2724695e9.3.1754989450650;
        Tue, 12 Aug 2025 02:04:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8113:2b11:8f42:672f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a053a9019sm104340625e9.21.2025.08.12.02.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:04:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: bpf@vger.kernel.org
Cc: stable@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv, bpf: use lw when reading int cpu in bpf_get_smp_processor_id
Date: Tue, 12 Aug 2025 11:02:56 +0200
Message-ID: <20250812090256.757273-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_020412_778706_A3ED8A58 
X-CRM114-Status: GOOD (  11.45  )
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

ZW1pdF9sZCBpcyB3cm9uZywgYmVjYXVzZSB0aHJlYWRfaW5mby5jcHUgaXMgMzItYml0LCBub3Qg
eGxlbi1iaXQgd2lkZS4KVGhlIHN0cnVjdCBjdXJyZW50bHkgaGFzIGEgaG9sZSBhZnRlciBjcHUs
IHNvIGxpdHRsZSBlbmRpYW4gYWNjZXNzZXMKc2VlbWVkIGZpbmUuCgpGaXhlczogMmRkZWMyYzgw
YjQ0ICgicmlzY3YsIGJwZjogaW5saW5lIGJwZl9nZXRfc21wX3Byb2Nlc3Nvcl9pZCgpIikKQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkg
PHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggNmUxNTU0ZDg5NjgxLi45ODgzYTU1ZDYx
YjUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtMTc2Myw3ICsxNzYzLDcgQEAgaW50IGJw
Zl9qaXRfZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2pp
dF9jb250ZXh0ICpjdHgsCiAJCSAqLwogCQlpZiAoaW5zbi0+c3JjX3JlZyA9PSAwICYmIGluc24t
PmltbSA9PSBCUEZfRlVOQ19nZXRfc21wX3Byb2Nlc3Nvcl9pZCkgewogCQkJLyogTG9hZCBjdXJy
ZW50IENQVSBudW1iZXIgaW4gUjAgKi8KLQkJCWVtaXRfbGQoYnBmX3RvX3J2X3JlZyhCUEZfUkVH
XzAsIGN0eCksIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KSwKKwkJCWVtaXRfbHco
YnBmX3RvX3J2X3JlZyhCUEZfUkVHXzAsIGN0eCksIG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5m
bywgY3B1KSwKIAkJCQlSVl9SRUdfVFAsIGN0eCk7CiAJCQlicmVhazsKIAkJfQotLSAKMi41MC4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
