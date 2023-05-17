Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5EAC77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 04:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6g1EHQhycIl3mcQ1js8jyoGCwZwtJJqSHGva+AxrTM=; b=DREZWMo2QOoDdC
	Y8jTjVnzNrs5og/0yDvWBOPyKUFEBpCT4DWNSMRkgRDV6KFNNXADw+Zk9aQ78LLI6pyUAqC7HPVzH
	ESgdz5G7INUXX8ZQDDHMc5f2Uos9GSrYZ2Q476u4yc5BcXiNLwZDFlKkkkSmLbMVHBDqWh1YjTPc8
	zFy7uy8YXpmpDJsvyikfN5tYJ51NHAcKgbFMRro2PFj/UW3SzkxpX85WrKJJbYQ9fih9TP/z+DQAT
	bkFODJjdLPxF6lP4ZQy+VFuQA+kO09KMCPaB8ktlWYVRFe+zA7e8LtVKM3xJ/DUqyd74HjpnXggLc
	++TJ3CONCg8q/ngNFZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz991-008B9h-2N;
	Wed, 17 May 2023 04:52:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz98y-008B6z-1z
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 04:52:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510b6a24946so577861a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 21:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684299122; x=1686891122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b36/I3Nvxt3FNBxeDqCvzRRZQkiU3g4TwUhxkdFSQg=;
        b=R1BrJpqiQkawOmNZ2eUhhs5aiZ5nUlvo15AH9j2qbT9j8Jji3gbHGSKO/XVeWn0WI7
         7A/j/ews7kjTxWKosbUvwcvh95heAYYhRAE/PsY/zkY3qZ1mz0YwED5uYSrTXM4UZWQa
         kqH1uBT7lySyT8wypk0ybYaVhRJw6ZsfxPx+jokTmGksad1wI6ldET5cs0AvdqrD/fgS
         OJ4+ODcRq0SEFlJ1mq/LMvStmBnHoGVDOa3+POzUQ/mLynmYYbELVGv5svV8Op/cyVLo
         vyW7fWuxUJl3/DKfWJ6slDK8by11R9Gk7LJUpHVKrjlD3Uelp4XV4PUOimEYgP2D6Yvf
         IPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684299122; x=1686891122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b36/I3Nvxt3FNBxeDqCvzRRZQkiU3g4TwUhxkdFSQg=;
        b=jY1dq4wmuKTDogJQdbU5x4qByEUMrsZFHDXfQ7PTMJJBQU2mfG0fIxSRPDu/5x+qzP
         iZXZ1QPLibxD8RNuh3ASY522cJ/OoDMaZ2qs5ujDzefALZSHJC4FawBTjQLzLbclcI5q
         OV26ZFm5e8Xr510/TDAZqyAtwBacOcCTC7oFju6y2xPObZzk7RNwvG1Y3DxofT8TmtRy
         EOSXlJarRO3NTP/DhpvaZVU3j2732etCrBN9JWaCX5KeweU+s8C47uyKrHt80/cO/F8G
         V3RwtFqyS0N4WSY1UxAesgi0HexeLhyxm+NNTHtu4Bv1tROVmmXwgn8gOz7PpqEC+FNp
         Ao3A==
X-Gm-Message-State: AC+VfDzTdjYjFbeIpxKYXqeV7kLqhzMaPkd4xzIuq86v5BAcMn359rrg
	vaYfQkJDxlD/OCa4ZXEytbGykI+bPdS0YvrO0TE=
X-Google-Smtp-Source: ACHHUZ7D+qbISKJO49ArIXkB3GqjJizoUnpsT6EzQe2Ml7LGi01etblSWEuPusR0eE7oY9uRaDlKRHwjCknPU//Wadg=
X-Received: by 2002:aa7:d94b:0:b0:506:bce0:48d6 with SMTP id
 l11-20020aa7d94b000000b00506bce048d6mr1186236eds.5.1684299121564; Tue, 16 May
 2023 21:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-3-zegao@tencent.com>
 <20230516091820.GB2587705@hirez.programming.kicks-ass.net>
 <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
 <20230517010311.f46db3f78b11cf9d92193527@kernel.org> <CAD8CoPAw_nKsm4vUJ_=aSwzLc5zo8D5pY6A7-grXENxpMYz9og@mail.gmail.com>
 <20230517115432.94a65364e53cbd5b40c54e82@kernel.org> <CAD8CoPC0BXB2ER_Oaixm5XgMk8TTqKVVF7Po0t4gBPOLhw_xwQ@mail.gmail.com>
 <20230516232545.4f6c7805@rorschach.local.home>
In-Reply-To: <20230516232545.4f6c7805@rorschach.local.home>
From: Ze Gao <zegao2021@gmail.com>
Date: Wed, 17 May 2023 12:51:50 +0800
Message-ID: <CAD8CoPBcP_T_-pR=szL7Vk0vtK3tzTsM6pPmqFcddcTa_ajrNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Jiri Olsa <jolsa@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>, 
	Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_215208_658671_2B83B087 
X-CRM114-Status: GOOD (  14.53  )
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

SGkgSmlyaSwKVGhpcyBpcyB0aGUgbGF0ZXN0IHZlcnNpb24gYWdhaW5zdCA2LjQtcmMxLCBhbmQg
eW91IGNhbiBhcHBseSB3aXRob3V0IHRyb3VibGUuCiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdHJhY2Uta2VybmVsLzIwMjMwNTE3MDM0NTEwLjE1NjM5LTEtemVnYW9AdGVuY2Vu
dC5jb20vVC8jdAoKUmVnYXJkcywKWmUKCk9uIFdlZCwgTWF5IDE3LCAyMDIzIGF0IDExOjI14oCv
QU0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IHdyb3RlOgo+Cj4gT24gV2Vk
LCAxNyBNYXkgMjAyMyAxMToxMDoyMSArMDgwMAo+IFplIEdhbyA8emVnYW8yMDIxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiA+IEdvdCBpdCEgOikKPiA+Cj4gPiBJIHdpbGwgaW1wcm92ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgYW5kIHNlbmQgdjMgQVNBUC4KPiA+Cj4gPiBCVFcsIHdoaWNoIHRyZWUgc2hv
dWxkIEkgcmViYXNlIHRob3NlIHBhdGNoZXMgb250bz8gSXMgdGhhdCB0aGUKPiA+IGZvci1uZXh0
IGJyYW5jaCBvZgo+ID4gZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Ry
YWNlL2xpbnV4LXRyYWNlLmdpdC4gSSBzYXcKPiA+IEppcmkgaGFkIHRyb3VibGVzCj4gPiBhcHBs
eWluZyB0aG9zZSBzaW5jZSB0aGVzZSB3b3JrcyBhcmUgYmFzZWQgb24gdjYuNC4wLgo+ID4KPgo+
IFlvdSBjYW4gc3VibWl0IGFnYWluc3QgNi40LXJjMS4gV2UgaGF2ZW4ndCB1cGRhdGVkIHRoZSBm
b3ItbmV4dCBicmFuY2gKPiB5ZXQuIFdoaWNoIHdpbGwgYmUgcmViYXNlZCBvZmYgb2Ygb25lIG9m
IHRoZSA2LjQgcmMncy4KPgo+IC0tIFN0ZXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
