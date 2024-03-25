Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC901C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRnDHphU9MhrpI+Fb2Tv9nprTtGt0hit1u6ZlEgAXdU=; b=kOBPDajfSQQqAH
	fciec+4DABiMM0AXatEMalAevt0X/xywp0vmbAbQ+3wxiGR+CBDd40O5qnz8UNLqXE/dK++OX4CXM
	gyoDbpNFQ45Q+F5u10ha1JF8wmgeR9yxV3oF4bx1iCMUi0DjR8oVv0dZ/QCNTNSKoCDyoyAlqDWyJ
	TlcrCMEiV12XuHPag+P8NU8g1vX9XaTspdQpbZFO1ifoqYOfjZX8RbOaYdkwNQk8NdPqqjFqZO3z3
	9zncOhpium7SIsLyN0M1hdN0pj8eIm5Lzy2iwgsr+N1vWFs5aJ230PsK1JLYHBnF1X9+tBBKFy+zX
	90NBrqKv14Ih8YDAg1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rojmb-0000000HNWF-0wUl;
	Mon, 25 Mar 2024 12:50:33 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rojmV-0000000HNTa-3fH6
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 12:50:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so1725770a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711371023; x=1711975823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RyxoVFw8iV/PhK2kQZFnetLsvcimHQCr4aKA83CIbw=;
        b=bPufzPmVhXq+MrzjHO9O/ET5wV/SHWoedfpvUQZkyXevFlu/ih8EFxCMsoxOOjnTAM
         Z2OBzwBvg0K3FEWADC/pAjfkFlwmhQ9fZyYT6d/w8vwAXooHFhUxTp+n8at2gwkK9bvR
         XDtizfSrHvAAqD3rjXtFZBw4hOghWTglxDqujrD2ADfAeLnEs8RGF0GbUEcRHyG5wGew
         b0k63Sv1UJrQ3HiNmSLWAiygz3QPA6pFMMRY2brFxB2kTWQ/QHCQdcYpwKiZ80uPgWjh
         KZK6OhvNbZ6znQRJjSUlnmyTay0nDVGx/S7O2rSYN5rPQIoO00IP0PFK2/KH1kLVgUBa
         kgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711371023; x=1711975823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RyxoVFw8iV/PhK2kQZFnetLsvcimHQCr4aKA83CIbw=;
        b=bJW+gjYofUSJLJSC0Sg+JpW7iUEyoGd7Rau0Y2jyruLh4Q5lcQ7Mcb0zGJep4HszgD
         GxvwatV0SaV4La4dmCcT+OEGQxEDqCOc0Z5TC+GIDmaVj6h+HlBNLea4hY9P00PEpiYv
         IIM/eeSZMGJ63r+I7XNZHPky8oNbdt95qWiOwWRdTloXghOUf36LvloZ9lH7FD2s+E8O
         rmQdV2jC3a/pC/XMu5y46C6FyyPExi+YbdqUMMmRCD7lzHdtbiQEQzhB7UAnLbVTOeni
         kUR2ZqfdAB103GqtkMHDAPx9voyLiVQ1FFTurP0u1xVC167ggz5VwJgtd7mc4KutJ5SX
         ve7A==
X-Forwarded-Encrypted: i=1; AJvYcCWzeT7zu0hcQK68ioFhsKKtEOEntCsQsgkQccKfGCRRuefIE6wCJD9HMmL0TXOzr0GnLb8O9o5YaUmlTLP1bKRi7GXK+7zt3WCRmR7FQctG
X-Gm-Message-State: AOJu0YwtOM7C8FNezRISgSUJs3qLQGbK+UPGWX5eD04NpeQX2fm988qG
	R35yGgcHlEyCyMigka2Mbtn0r3FfH5Ttaoy5DBO0HLJWhgyOBnGUcSeO7jV6R/5zLLq+4ykr2by
	YLIQHbN9F/eiyG66JW3xuBxBF//DrxPOLdDdF2g==
X-Google-Smtp-Source: AGHT+IFavvihRisV9kCaSJXWkP5NlMeM+2ciaavifWQ9HNV1hzqkvuSD7eRB5OdriFQR916iQBclkPwrahehtGboVyQ=
X-Received: by 2002:a17:90a:b30c:b0:29c:5c56:ffea with SMTP id
 d12-20020a17090ab30c00b0029c5c56ffeamr4730905pjr.6.1711371023055; Mon, 25 Mar
 2024 05:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240306165904.108141-1-puranjay12@gmail.com> <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N> <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com> <87zfv0onre.fsf@all.your.base.are.belong.to.us>
 <87il1oedx8.fsf@all.your.base.are.belong.to.us> <CABgGipWPuvwi43v1+60-=0_MN_q_CD0ZGasxHHVWJ37cig5MmA@mail.gmail.com>
 <87msqsotr8.fsf@all.your.base.are.belong.to.us> <CABgGipUayONdvaH0nexBJUai=qT3yqURhinTbDWxORfMDQ_5pw@mail.gmail.com>
In-Reply-To: <CABgGipUayONdvaH0nexBJUai=qT3yqURhinTbDWxORfMDQ_5pw@mail.gmail.com>
From: Robbin Ehn <rehn@rivosinc.com>
Date: Mon, 25 Mar 2024 13:50:11 +0100
Message-ID: <CAEEvPLB0eVXwRxucKDtc4mG11BwueV4pk4g9Zi82MPeTaP41uw@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Andy Chiu <andy.chiu@sifive.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Bjorn Topel <bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, 
	"Cl'ement L'eger" <cleger@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Brendan Sweeney <brs@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_055028_264294_A169FF51 
X-CRM114-Status: GOOD (  13.28  )
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

SGV5LAoKPiA8aW5kZXgtaW4tZGlzcGF0Y2gtbGlzdD4KPiBmdW5jX3N5bWJvbDoKPiBhdWlwYyB0
MCwgY29tbW9uX2Rpc3BhdGNoOmhpZ2ggPD0+IGogYWN0dWFsX2Z1bmM6Cj4gamFsciB0MCwgY29t
bW9uX2Rpc3BhdGNoOmxvdyh0MCkKPgoKSWYgeW91IGFyZSBwYXRjaGluZyBpbiBhIGp1bXAsIEkg
ZG9uJ3Qgc2VlIHdoeSB5b3Ugd291bGRuJ3QganVtcCBvdmVyCmxkK2phbHI/IChubyBuZWVkIGZv
ciBjb21tb24gZGlzcGF0Y2gpClBhdGNoaW5nIGphbHIgd2l0aCBub3AsIGFuZCBrZWVwaW5nIGF1
aXBjLCBhZGRyZXNzZXMgdGhlIGlzc3VlIHdpdGgKaGF2aW5nIHRvIGp1bXAgaW4gdGhlIGRpc2Fi
bGVkIGNhc2UuCkJ1dCBuZWVkcyBlaXRoZXIgY29tbW9uIGRpc3BhdGNoIG9yIHBlciBmdW5jIGRp
c3BhdGNoLgoKVGhhbmtzLCBSb2JiaW4KCj4gY29tbW9uX2Rpc3BhdGNoOgo+IGxvYWQgdDEsIGlu
ZGV4ICsgZGlzcGF0Y2gtbGlzdAo+IGxkIHQxLCAwKHQxKQo+IGpyIHQxCj4KPgo+ID4KPiA+ID4g
SG93ZXZlciwgb25lIHRoaW5nIEkgYW0gbm90IHZlcnkgc3VyZSBpczogZG8gd2UgbmVlZCBhIGRl
c3RpbmF0aW9uCj4gPiA+IGFkZHJlc3MgaW4gYSAicGVyLWZ1bmN0aW9uIiBtYW5uZXI/IEl0IHNl
ZW1zIGxpa2UgbW9zdCBvZiB0aGUgdGltZSB0aGUKPiA+ID4gZGVzdGluYXRpb24gYWRkcmVzcyBj
YW4gb25seSBiZSBmdHJhY2VfY2FsbCwgb3IgZnRyYWNlX3JlZ3NfY2FsbC4gSWYKPiA+ID4gdGhl
IG51bWJlciBvZiBkZXN0aW5hdGlvbiBhZGRyZXNzZXMgaXMgdmVyeSBmZXcsIHRoZW4gd2UgY291
bGQKPiA+ID4gcG90ZW50aWFsbHkgcmVkdWNlIHRoZSBzaXplIG9mCj4gPiA+IDxmdW5jX3RyYWNl
X3RhcmdldF9kYXRhXzhCX3Blcl9mdW5jdGlvbj4uCj4gPgo+ID4gWWVzLCB3ZSBkbyBuZWVkIGEg
cGVyLWZ1bmN0aW9uIG1hbm5lci4gQlBGLCBlLmcuLCB1c2VzCj4gPiBkeW5hbWljYWxseS9KSVQ6
ZWQgdHJhbXBvbGluZXMvdGFyZ2V0cy4KPiA+Cj4gPgo+ID4KPiA+IEJqw7Zybgo+Cj4gQ2hlZXJz
LAo+IEFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
