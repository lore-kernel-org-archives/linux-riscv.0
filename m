Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80A0C7EE26
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsCUJu3V9zq8Og74np/bjSuMD5B/JLEr8LjsJnAaAPo=; b=ll/BRKT6Yg5JAr
	L4W1jEUXGaMhrhB3bKZGs5QSbfZvGntUaZxdye7wPXEx+8GGp7LAtjWQKLrJG50AwUpOJSSjIcMUg
	LtcYHQ9nMiSFyY37urGnLXbk+KR/4atywQAsqce0agcd1Mmdoqah3rll5JVwbkUAoxJ8MEtswidFt
	+nRDT9La2lxrt01J5Fnb/5d1seOCuC27EjUhj8rEAJxXNfY4u2UEul99teTXvxhtcLgzoRIHnqk0m
	5FBmcZ4hIdEugMdccXVU5gYPn1fgAcZXeoal9OKfaZj8XWlo6rVoKa810OIMVJ4BiB2PI0hj+8za5
	0nuzrloiXCogjSCKdrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrLU-0058tD-2j;
	Tue, 16 May 2023 09:51:52 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrLR-0058rO-2t
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 09:51:51 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so13123493a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684230706; x=1686822706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGRnr0pf14CHov8UGeE0opuOVSemy26gQSSgqCQ8OBg=;
        b=TyARuFrePmLKzB8Y4APhEC1j3pOxio/NqSOHioZ3lmLXGK4vgLurB9WR8Xw8wEjvuO
         /yfg1Da7tiI8dzFEUflqoVQzHmxBBnpuU71cWAw50ixw7Ka9TRejd+rX7vG2S8Ne48r8
         f6V9/YrBojQxHWio238iQe75dZ7bcWtO3IaVZ/5wDp3yAOdqaQmnJ/2ySO3Mq2qUVvQd
         sOJNoY85jjHhy8Sw0/IFm+REkH+A+srv4nBaS6drUg95ae6FuXM8X11uuk9yj2B4Sc3d
         zdhE+SFulVdAWHIKroDxhu/T9R6ja8UPKEziJmYYS0WRcA9mExznmwHyM0kf+vRWl9LQ
         4FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684230706; x=1686822706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGRnr0pf14CHov8UGeE0opuOVSemy26gQSSgqCQ8OBg=;
        b=SHmKPgW7tDmv8Vq+pGl9naIlGZHa8Qb/vVNU1SLH1rIjiYc653vgad52HFSopiVfZc
         i/2rJxHwOyf1MWMr9dpltrREOaJGtb+qmNJBsL2jtfrZrvG3fn+G406gK9xtqDkmFfbv
         MM0VBrkg8xssFnR/vDrBqRyEviyTFBQ7W0ZIXtpSq9w1Kk5FMtNtdcSd7qg0tUFng+R1
         NwBtoBkg94qN+B29GGmcI57CU0cYmD6oYKjp9yvJfOvg/T9sZNZz9J2FkRWSxdbkdVJV
         bbS6aaQ0I5+SVz4dtPGDsvegDWys7/D14SW083Hvj9REVyHcIu4TvwHMPSdw1vBPe/hw
         Kucw==
X-Gm-Message-State: AC+VfDwK1DJyjWiK39LlZ8pIpwlpqoLtc5uSrwGLWfOfW71zemP5Mrao
	b/oTfcc7KVf++Ppkpe+R7jn1pmB7xgOmj2atS5U=
X-Google-Smtp-Source: ACHHUZ5xpt1T33EGstq2xec0xYohfOgkI64LW6Py10ItFNbeyutFXIVDZoxai5C+HNRhgxKoCsdtIb8OrXa0qnnf6os=
X-Received: by 2002:a05:6402:482:b0:50c:52d:7197 with SMTP id
 k2-20020a056402048200b0050c052d7197mr25360576edv.2.1684230705817; Tue, 16 May
 2023 02:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-3-zegao@tencent.com>
 <20230516091820.GB2587705@hirez.programming.kicks-ass.net> <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
In-Reply-To: <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
From: Ze Gao <zegao2021@gmail.com>
Date: Tue, 16 May 2023 17:51:34 +0800
Message-ID: <CAD8CoPDu=u4vxEYiaZfne92yZ=uTcAEPzWPbdjncyfbSyuCpfg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_025149_934842_F0BA167F 
X-CRM114-Status: GOOD (  15.13  )
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

U29ycnkgZm9yIHBhc3RlIHRoZSB3cm9uZyBsaW5rLCBpdCdzIHRoaXMgb25lIGluc3RlYWQ6CiAg
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjMwNTEzMDAxNzU3Ljc1YWUwZDFi
QHJvcnNjaGFjaC5sb2NhbC5ob21lLwoKSXQncyB0aGUgb3JpZ2luYWwgZGlzY3Vzc2lvbnMgb2Yg
dGhpcyBwcm9ibGVtLgoKUmVnYXJkcywKWmUKCk9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDU6NDfi
gK9QTSBaZSBHYW8gPHplZ2FvMjAyMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUHJlY2lzZWx5LCB0
aGVzZSB0aGF0IGFyZSBjYWxsZWQgd2l0aGluIGtwcm9iZV9idXN5X3tiZWdpbiwgZW5kfSwKPiB3
aGljaCB0aGUgcHJldmlvdXMgcGF0Y2ggZG9lcyBub3QgcmVzb2x2ZS4KPiBJIHdpbGwgcmVmaW5l
IHRoZSBjb21taXQgbWVzc2FnZSB0byBtYWtlIGl0IGNsZWFyLgo+Cj4gRllJLCBkZXRhaWxzIGNh
biBjaGVja2VkIG91dCBoZXJlOgo+ICAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC10cmFjZS1rZXJuZWwvMjAyMzA1MTYxMzI1MTYuYzkwMmVkY2YyMTAyODg3NGE3NGZiODY4
QGtlcm5lbC5vcmcvCj4KPiBSZWdhcmRzLAo+IFplCj4KPiBPbiBUdWUsIE1heSAxNiwgMjAyMyBh
dCA1OjE44oCvUE0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToK
PiA+Cj4gPiBPbiBUdWUsIE1heSAxNiwgMjAyMyBhdCAwMzoxODoyOFBNICswODAwLCBaZSBHYW8g
d3JvdGU6Cj4gPiA+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gY2FsbHMga3Byb2JlIHJlbGF0ZWQg
ZnVuY3Rpb25zIGJlZm9yZSBkb2luZwo+ID4gPiBmdHJhY2UgcmVjdXJzaW9uIGNoZWNrIGluIGZw
cm9iZV9rcHJvYmVfaGFuZGxlciwgd2hpY2ggb3BlbnMgZG9vcgo+ID4gPiB0byBrZXJuZWwgY3Jh
c2ggZHVlIHRvIHN0YWNrIHJlY3Vyc2lvbiBpZiBwcmVlbXB0X2NvdW50X3thZGQsIHN1Yn0KPiA+
ID4gaXMgdHJhY2VhYmxlLgo+ID4KPiA+IFdoaWNoIHByZWVtcHRfY291bnQqKCkgYXJlIHlvdSBy
ZWZlcnJpbmcgdG8/IFRoZSBvbmVzIHlvdSBqdXN0IG1hZGUKPiA+IF9ub3RyYWNlIGluIHRoZSBw
cmV2aW91cyBwYXRjaD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
