Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D60C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmdsmtcCRq33AfvK+ZkfSOSLiqqdXtvXgmT/eZRWQHY=; b=iAtm4xuVbZY32l
	O/envvdnmie5vvF0tuAlNW7N3Nlo8nVZISsNQ/15u7gB6QUMN0xkONGqZWm8jYKsGQ9u1F8J6hMxL
	DoydzW4NB1uxbsHfaJT3XcTFE+EQ+PhF07XTPC+Kc4zJeRPruyod9HDBfBxkvEE5CKmp/ak+C2nRa
	CWvIj+CMfmy+Iq4ZXqhOeTUpCLKO5FtslhGu4pQ1MQZcf93dBCtd2hgECGSJRwjF83Jb/ekWiJP8U
	+6pHxraLIU2nwSSERWwSO8qKvgDJLOSkFlhe9nSTlBNniNuuZg/MofAiUn6/fjBLVLRJ6VohFA+2z
	MurphkDceTZ1UYDh6RWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdni-00000009INB-0EoD;
	Thu, 01 Feb 2024 20:36:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdng-00000009IMj-0mbK
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 20:36:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33b1a51743fso572580f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 12:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706819802; x=1707424602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1rOAnks+IZIRKFOoQxMMgMUJD9hU55SNyeP1OvjJ+E=;
        b=cpWueU8IRA1QI5qjtjTz+RbA+2kFqG5MnJle+6/JSVvBzYuG+SUyaLDXvg3Oy9uTzo
         3DfdTVVk9ma3GMBuj7Jd993RsTgV2hlrd5a0KKJW1PgfSa6ZjCe43sZgtEjym9VKK9Ui
         FU6zYJynIdVTs2DJNkctfm1vlwDdVLxynMF5ZviZhDop78+Z/oUkXjjgap0Rw1k0r0qb
         eMVAI8ElIHp1jkvUdwO4oKxN33bpzCS+rRMcw13KnNBXXXXC7t+p1q0q0ayE9pdiQsAS
         +CTW1j4eXxhKAwjCAHYvSfvI1QzyhCKBpJg7bTzVj2cuQHIgsj4GTfeyzGIrqXQsUKJl
         9LzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706819802; x=1707424602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1rOAnks+IZIRKFOoQxMMgMUJD9hU55SNyeP1OvjJ+E=;
        b=EBXXvmAQmxRORO1HYdOFgQWy/Qxb4VIdmvW5sueanGOgi0oNZq1zBQyOKZwIzMbvoi
         v6eKet6paNPW8HVdhnVMfgg+PUCHm1JWm6KbOXgfIbmJ+U2wZc5sURfyzSnctpa5WnBF
         UsUZyHmbKBPFB1V4M6lJ1365eAUEx74iGbup2YqOFRmC9LckG8zmcfxSLlDEIXjhguLD
         59BeLvHNVgjgUscAtw69cQqoGqnLXYHDlpkor9HKQAEpHq3XghYL3PZ3NsQqnYkQpzq5
         N8Te/Z1nYm0no/FmIfOy04uFFqdIPtZwWe7Uwmz8rgtA5Zbg7M3TO13x1mUqg7/qbPYi
         mL2Q==
X-Gm-Message-State: AOJu0YyYRqEgrgNC/1QEb4WryME474vIVI9MnphLMVVG/ekS+Js1owGJ
	dVnz6YEuVgCuzWhyNEYqqzKMMLEZLIBzJkt3BBgoGE95ViGcz26ZiXTUz148XL5YOYIlLTcTz59
	vFAKOG6fIzIx5om7YGiYZPzK+Sv0=
X-Google-Smtp-Source: AGHT+IFFBt5YrQiVi1KM33MeIXTr84iePPwBvMBSrk2lEQIfOz8KCrXcZ9iChz/3hYD9+MHfSxbpDLnqctJ+uMo7MAk=
X-Received: by 2002:adf:ef44:0:b0:33a:e4de:9afd with SMTP id
 c4-20020adfef44000000b0033ae4de9afdmr3650651wrp.29.1706819802156; Thu, 01 Feb
 2024 12:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
 <1e7181e4-c4c5-d307-2c5c-5bf15016aa8a@iogearbox.net> <CAADnVQ+rLneO4t=YYmLYtc945Fz0=ucNTWZBxgvs8toFY-onRg@mail.gmail.com>
 <871q9w9jno.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <871q9w9jno.fsf@all.your.base.are.belong.to.us>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 1 Feb 2024 12:36:31 -0800
Message-ID: <CAADnVQKftCnTnvyGwwWZu73zeqP8f_acoyMjwSpE+tj2dN1irQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] Mixing bpf2bpf and tailcalls for RV64
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Pu Lehui <pulehui@huaweicloud.com>, 
	bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Network Development <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>, Leon Hwang <hffilwlqm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_123644_244290_B077DF43 
X-CRM114-Status: GOOD (  18.05  )
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

T24gVGh1LCBGZWIgMSwgMjAyNCBhdCA5OjMw4oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbGV4ZWkgU3Rhcm92b2l0b3YgPGFsZXhlaS5zdGFyb3ZvaXRv
dkBnbWFpbC5jb20+IHdyaXRlczoKPgo+ID4gT24gVGh1LCBGZWIgMSwgMjAyNCBhdCAyOjU24oCv
QU0gRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4gd3JvdGU6Cj4gPj4KPiA+
PiA+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3ZSBpbXBsZW1lbnRlZCBtaXhpbmcgYnBmMmJwZiBh
bmQgdGFpbGNhbGxzCj4gPj4gPiBzaW1pbGFyIHRvIHg4Nl82NCwgaS5lLiB1c2luZyBhIG5vbi1j
YWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8gdHJhbnNmZXIKPiA+IC4uLgo+ID4+IElpdWMsIHRoaXMg
c3RpbGwgbmVlZHMgYSByZXNwaW4gYXMgcGVyIHRoZSBvbmdvaW5nIGRpc2N1c3Npb25zLiBBbHNv
LAo+ID4+IGlmIHlvdSBoYXZlIHdvcmtlZCBvbiBCUEYgc2VsZnRlc3RzIHdoaWNoIGV4ZXJjaXNl
IHRoZSBjb3JuZXIgY2FzZQo+ID4+IGFyb3VuZCBhNiwgcGxlYXNlIGluY2x1ZGUgdGhlbSBpbiB0
aGUgc2VyaWVzIGFzIHdlbGwgZm9yIGNvdmVyYWdlLgo+ID4KPiA+IEhvbGQgb24sIGZvbGtzLgo+
ID4gSSdtIG5vdCBzdXJlIGl0J3Mgc3VjaCBhIGNvZGUgaWRlYSB0byBzdXBwb3J0IHRhaWxjYWxs
cyBmcm9tIHN1YnByb2dzCj4gPiBpbiByaXNjLXYuCj4gPiBUaGV5J3JlIGJyb2tlbiBvbiB4ODYt
NjQgYW5kIHNvIGZhciBzZXZlcmFsIGF0dGVtcHRzIHRvIGZpeCB0aGVtCj4gPiB3ZXJlIG5vdCBz
dWNjZXNzZnVsLgo+ID4gSWYgd2UgZG9uJ3QgaGF2ZSBhIGZpeCBzb29uIHdlIHdpbGwgZGlzYWJs
ZSB0aGlzIGZlYXR1cmUgY29tcGxldGVseQo+ID4gaW4gdGhlIHZlcmlmaWVyLgo+ID4gSW4gZ2Vu
ZXJhbCB0YWlsY2FsbGluZyBmcm9tIHN1YnByb2dzIGlzIGEgbmljaGUgdXNlIGNhc2UuCj4gPiBJ
ZiB0aGVyZSBhcmUgdXNlcnMgdGhleSBzaG91bGQgdHJhbnNpdGlvbiB0byB0YWlsIGNhbGwgZnJv
bSBtYWluIHByb2cgb25seS4KPiA+Cj4gPiBTZWUKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2JwZi9DQUFEblZRSjFzenJ5OVAwMHd3ZVZEdTRkMEFRb01fNDlxVC1fdWVpcnZnZ0FpQ1pycHdA
bWFpbC5nbWFpbC5jb20vCj4KPiBHb3QgaXQuIC4uLmFuZCBpdCdzIGJyb2tlbiBvbiBhcm02NCBh
cyB3ZWxsPwoKTm90IHN1cmUuIGFybTY0LCBzMzkwLCBsb29uZ2FyY2gsIHg4NiBjbGFpbSB0byBz
dXBwb3J0IGl0LgpGb3IgYSBsb25nIHRpbWUgd2UgdGhvdWdodCB0aGF0IGl0IHdvcmtzIG9uIHg4
NiB1bnRpbCBMZW9uIGNhbWUgdXAKd2l0aCBhIHdheSB0byBicmVhayBpdC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
