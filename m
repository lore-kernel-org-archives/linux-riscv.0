Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0693EC7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbRRmqLg/5mXcJKnCr/0AJ932ohDOwCGCq0KsJonjdo=; b=FpNAGwJB0TGquH
	HK5vw5KlALVUdJZ6zhHYreRpLU794kZ2DyL8eClnrxUUZfMfV6Mu+O7JbsLwXg97xpYMRUz+Nzovj
	jYSUiGLASr0kiJz+6lLRJltAiG82S5PkbBNZgKiN4vZRDOiwo3zENWDLG79WU5mf0mquwtG5bEL3W
	E+ramYiCqwes4j7+Ty0/sdNDampYA1OzlG+gagTyFgUxfYEgD+qhmh4Z6UmThZ6I/K1zbIu89Arz3
	7wtKP9FlPSxWlpoo93am/VrC0V3kjsT+Wx/vGJhcFwSnYOyVPlDE6GuF9+/HUxaqoLyKXf/qnTeyI
	Dra+iBf9MFsEI5Q6uQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6Sw-007lKH-2G;
	Wed, 17 May 2023 02:00:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6St-007lID-35
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 02:00:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-510b869fe0dso333932a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 19:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684288825; x=1686880825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKuJtUgRGoAveoB6dPRcY53BxMHmJW4YivLP7XJy1Ow=;
        b=oEJH3YQ6WJ1R0OeRcB1/RwAm81/CWoDJLhbS/+eBIUbEEgBfrBcwY4jg02JHw4xZGl
         2IJfYYQjgXKHbc1Ai3f81W4K9sTZCQAO+WSkEMbI1vQD/TyYDVSLtlwqQEy19TIbmi/y
         IJ/MxVA0NVWR4uhCrNUVK513twP+NIU3bPu/zGrg+ZsRCsm7yAAOOVkPR5qvMvkucsXm
         jG7Ood62c+ARTTr3hKMnTWA2o7RoVGHzT3y2QwOE9VPCWREMHlmxAO/DDiyFMJFJMxB6
         q/w0HkiATVBsVpcbCZDmPe++RtEEFQXqwUBKisYQhi+wnYe9t+yadRw0fyTFkZO2Zd2M
         nQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684288825; x=1686880825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKuJtUgRGoAveoB6dPRcY53BxMHmJW4YivLP7XJy1Ow=;
        b=FlWlk38yKnWon9QAVvt0UxTyXHZUizRz+2tvRPKCQpVP1bMzDbv02n+G0W69eayZGp
         xL3pQI4ndlwdQtiMDuiwOyNxO05ShghwhTg7RiBg2d1lOBNPXZCL8sqKTBjjiR0PNlTu
         znGuh/QxkF0PSjnP+fWrUgNktfntj/S8h62v/XSvBaOvZirvNGOIUL2VRewiuzXvLJoI
         kCrMXh3yimZeLAP/w0SSC4UFc9DNR3AqoX3XM89NirLkozSNNmBv4Yrk+ChwKKcPTLzM
         mgZH5QhqWexiuqYSqx8ZbzM4Wm1gUr/8t6yjbrRB4NoWQ22npigHQ1gLTjWX/EoQr8DF
         e6JA==
X-Gm-Message-State: AC+VfDyS9/4Txhv7kepgCwatXsblIyDseN730s4/gKY6yqVC9U6sFmcy
	kExnw9AsIDMWZKZrlCQSFArjw0gAeziUo/UeQCQ=
X-Google-Smtp-Source: ACHHUZ5ODPhwCTAYdcAaNc6Khvr+LCB4zW0u1dxcHa+DA93pmjpNLl78rK2aOOMj6HEyRyZD4FRw1jZuCyKZ5xevtzQ=
X-Received: by 2002:a50:fb87:0:b0:50b:c72a:2b26 with SMTP id
 e7-20020a50fb87000000b0050bc72a2b26mr857161edq.9.1684288824921; Tue, 16 May
 2023 19:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-5-zegao@tencent.com>
 <20230516102006.76dfd68a@gandalf.local.home>
In-Reply-To: <20230516102006.76dfd68a@gandalf.local.home>
From: Ze Gao <zegao2021@gmail.com>
Date: Wed, 17 May 2023 10:00:13 +0800
Message-ID: <CAD8CoPA=VQOnnZujzH7n3X1t=PpoduB20vM0KQh8aPubySzCzw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rehook, fprobe: do not trace rethook related functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
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
X-CRM114-CacheID: sfid-20230516_190032_011377_E42712F2 
X-CRM114-Status: GOOD (  12.10  )
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

R290IGl0ISAgVGhhbmsgeW91LCBTdGVldm4uICBNYXliZSBJIGNhbiBnaXZlIGl0IGEgdHJ5IGxh
dGVyIDopCgpSZWdhcmRzLApaZQoKT24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgMTA6MjDigK9QTSBT
dGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDE2
IE1heSAyMDIzIDE1OjE4OjMwICswODAwCj4gWmUgR2FvIDx6ZWdhbzIwMjFAZ21haWwuY29tPiB3
cm90ZToKPgo+ID4gIENGTEFHU19SRU1PVkVfZWFybHkubyAgICAgICAgICAgICAgICA9ICQoQ0Nf
RkxBR1NfRlRSQUNFKQo+ID4gK0NGTEFHU19SRU1PVkVfcmV0aG9vay5vICAgICAgICAgICAgICA9
ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4KPiA+ICBlbmRpZgo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3g4Ni9rZXJuZWwvTWFrZWZpbGUKPiA+IGlu
ZGV4IGRkNjE3NTJmNGM5Ni4uNDA3MGEwMWMxMWI3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC94ODYv
a2VybmVsL01ha2VmaWxlCj4gPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvTWFrZWZpbGUKPiA+IEBA
IC0xNyw2ICsxNyw3IEBAIENGTEFHU19SRU1PVkVfZnRyYWNlLm8gPSAtcGcKPiA+ICBDRkxBR1Nf
UkVNT1ZFX2Vhcmx5X3ByaW50ay5vID0gLXBnCj4gPiAgQ0ZMQUdTX1JFTU9WRV9oZWFkNjQubyA9
IC1wZwo+ID4gIENGTEFHU19SRU1PVkVfc2V2Lm8gPSAtcGcKPiA+ICtDRkxBR1NfUkVNT1ZFX3Jl
dGhvb2subyA9IC1wZwo+Cj4gVW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGJ1dCBzb21lZGF5IHdl
IG5lZWQgdG8gY2hhbmdlIHRoZSAtcGcgYWJvdmUgdG8KPiAkKENDX0ZMQUdTX0ZUUkFDRSkuCj4K
PiAtLSBTdGV2ZQo+Cj4KPiA+ICBlbmRpZgo+ID4KPiA+ICBLQVNBTl9TQU5JVElaRV9oZWFkJChC
SVRTKS5vICAgICAgICAgICAgICAgICAgICAgICAgIDo9IG4KPiA+IC0tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
