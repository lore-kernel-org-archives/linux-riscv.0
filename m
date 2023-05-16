Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD6EC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfOrEqNqtuzEJZtUb2VGfji+RH1jL6UQpf8UhHtoAqU=; b=LkllNoRFQchH7o
	uqC+z7Z9pxLTZZnKVxKbcKlVA7GuKMAdmrACXVE53izjBwOxOpxXmwyFHLsiy4osFbXkvCyCqF8rB
	oI6qXTpTLNfE+w34ir0nJ2Bvk6T/BLNZSnGSdEhlZFlr+4rjgqictYBKUnaGLQv0OkiA707hMHbYe
	h3gW6vGDjbo/QIAvYfjAAKRmpOxhxAJbesN1pUuITRYGrRwIav38X7KS/74v9INSKIREHjo0mw8tO
	1se+Kb+y9nsfNh+ypPRXQiG3/M1vNYFmOJPdo2qQmzt5njKZ6oYbxz3apf1eVWsoUihgPYGnLiLFc
	8fHfhfnE3HIgaFeSnVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrHs-00583e-1K;
	Tue, 16 May 2023 09:48:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrHp-00582c-2C
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 09:48:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso24951789a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 02:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684230484; x=1686822484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvja6u6ZFGfnkLgz3Y8JuncRIU7gT8PI/VykX029Ek8=;
        b=TC7kZ/eTedXqDpQDxFKtRdYmJcctfLX6NTMRBtAufhESfjfZFEbqTOwHLyakOCtvW0
         AMBh812gNA/G0aj8rpTd6aE2NMZwOWYIQ+dEhHCfRIT7f+UR/e+BwhnodvdfqbO+wb6U
         eRsVzFQ9r9dSTvVsd8slJf/AXpUgm3neL8HFRbZ6TvzwrSj9eaa80Kd5Ae0mH3g38KWb
         0rxQElUd98LPtTocedpBmQtSgxVDb+DXoUfIwerj3++n+SHfyWBHYYoVGZYZH8cc1Rp/
         iCPK5pJKUn4uSOhWWDOrnur3lpeS2sVYd3XMEmKfCashfPiPR9u8n5okyWqkkRdaFWdM
         /zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684230484; x=1686822484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvja6u6ZFGfnkLgz3Y8JuncRIU7gT8PI/VykX029Ek8=;
        b=O99w/aKi+1MPbTQ1QrbDYxXi9N3xj7tksIncxj4/YOfGsho5LQMnjlelvf744V0/aQ
         SUqg+6Af8SkAkFETeEVTpVMryBr0pfabwqIoYvOnkAqpKfkQJrtDhZHXfW6Qedxr3HEW
         5ak9mJmb1dyy3zbZ9z9i7MkSyYsx+LjVGr6QBnhFsMyENmwb5o/vlqQ6BSamdyTcxuKx
         vdh8zjhA5ikT9qTxSZuW/LRbBNWfeFW8HSdgsMR8r8VACKNspsUdRbI9fZ9cPUQZcOQl
         /XZokFOR0vHZrE0cTmR4sTlsgmedIKkNNptwdfqGM9kwAasI9ot1nqha2NUFsHyy4GJE
         G0Iw==
X-Gm-Message-State: AC+VfDyFA7Lf6082ri19weM/NFiOMBtF+K8oYOHN5S+FyO2P9cz+llEs
	oWLdx3/ic6gg8aBAScV2gerfvEqvozxhW4Nc88k=
X-Google-Smtp-Source: ACHHUZ58Xk+LnHJqjDTQuzlbH9AZ2ZBiLiSzhynrpP51aJp6KZ9Hq9kWwdgsjYeQWqA2BDUz86yph1wPMeprS3aKpgQ=
X-Received: by 2002:aa7:d943:0:b0:510:47a3:e775 with SMTP id
 l3-20020aa7d943000000b0051047a3e775mr6274132eds.41.1684230483965; Tue, 16 May
 2023 02:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-3-zegao@tencent.com>
 <20230516091820.GB2587705@hirez.programming.kicks-ass.net>
In-Reply-To: <20230516091820.GB2587705@hirez.programming.kicks-ass.net>
From: Ze Gao <zegao2021@gmail.com>
Date: Tue, 16 May 2023 17:47:52 +0800
Message-ID: <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230516_024805_744800_67974CBD 
X-CRM114-Status: GOOD (  11.75  )
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

UHJlY2lzZWx5LCB0aGVzZSB0aGF0IGFyZSBjYWxsZWQgd2l0aGluIGtwcm9iZV9idXN5X3tiZWdp
biwgZW5kfSwKd2hpY2ggdGhlIHByZXZpb3VzIHBhdGNoIGRvZXMgbm90IHJlc29sdmUuCkkgd2ls
bCByZWZpbmUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2UgaXQgY2xlYXIuCgpGWUksIGRldGFp
bHMgY2FuIGNoZWNrZWQgb3V0IGhlcmU6CiAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC10cmFjZS1rZXJuZWwvMjAyMzA1MTYxMzI1MTYuYzkwMmVkY2YyMTAyODg3NGE3NGZi
ODY4QGtlcm5lbC5vcmcvCgpSZWdhcmRzLApaZQoKT24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgNTox
OOKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBP
biBUdWUsIE1heSAxNiwgMjAyMyBhdCAwMzoxODoyOFBNICswODAwLCBaZSBHYW8gd3JvdGU6Cj4g
PiBDdXJyZW50IGltcGxlbWVudGF0aW9uIGNhbGxzIGtwcm9iZSByZWxhdGVkIGZ1bmN0aW9ucyBi
ZWZvcmUgZG9pbmcKPiA+IGZ0cmFjZSByZWN1cnNpb24gY2hlY2sgaW4gZnByb2JlX2twcm9iZV9o
YW5kbGVyLCB3aGljaCBvcGVucyBkb29yCj4gPiB0byBrZXJuZWwgY3Jhc2ggZHVlIHRvIHN0YWNr
IHJlY3Vyc2lvbiBpZiBwcmVlbXB0X2NvdW50X3thZGQsIHN1Yn0KPiA+IGlzIHRyYWNlYWJsZS4K
Pgo+IFdoaWNoIHByZWVtcHRfY291bnQqKCkgYXJlIHlvdSByZWZlcnJpbmcgdG8/IFRoZSBvbmVz
IHlvdSBqdXN0IG1hZGUKPiBfbm90cmFjZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2g/CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
