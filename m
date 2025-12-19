Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1CDD78785
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXAYiTTVdNsuZVF6Deo6NLKuAUHmtT6T/kx2lIdULFM=; b=Vh2zEqgzotJttR
	bJKgvlfuT4458ga0AummEuhXL30+MDhpnKnAUfoRyhTMjjoAZ6XTQIHJIR1W4VpGHDmEUf/doKj0I
	pv/kT5TYAk/SqTYNr3tgouKc3Tcb2mwklJySrdqL5g9DM3l5ibNouqrNdasof8v7lwYI29sp5IYvE
	CC9kGdA6Nl60c4ya7POQOf3GaB94S0hrH3EwWIW6XmeSi1d6ImJr1RvrvJ48bZXvLa7QOuaDGxQs2
	EsXbG0QKYHuTtaZflHJmgYjenW9D6KDQhVHqqBaloG3FB6NgKxDOiAl/609ycleaul1HJ5ciDdaDV
	OicQLuCJVbvCI5pAYvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbsS-0000000AStQ-2EXm;
	Fri, 19 Dec 2025 14:54:44 +0000
Received: from mail-yw1-x1144.google.com ([2607:f8b0:4864:20::1144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbsP-0000000ASsq-28ms
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 14:54:42 +0000
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-78fb7704cb4so4675337b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766156080; x=1766760880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDdaTMRRYAY1qSHlAuTYn+8+uE5UBoDcaSos5vnXy9g=;
        b=DK59Rkfa2umxsxqqVZZ/uv1B0La6gGUIrJTxNHeYdiRMJmVc5DEoeK9SloXRHMJ1FF
         X0pzEiiPBspUleft2gN6ZD1MHmz597UWLUCLEr2kvqHKo+krxeQ0etTotha5ppx7nk/8
         e3dxUHU6dhSkx9Dv2g4A/viohb11SBXB37mR0B4/U9ziM0K6d7wCvqZ0q4ybj0CfZool
         h9m4munxt0p4QNlEWvJx9pO01RlM7/tXaxndQGma21JplDuxj1tB4BkuF0MwbrUKvaPc
         VYadz9DAoYysd15kOcUoFS4UKgyWjQgWL9paEnzj4PpQ5RdDjPvXXnAva7HlyZcZiQ0A
         SAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156080; x=1766760880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iDdaTMRRYAY1qSHlAuTYn+8+uE5UBoDcaSos5vnXy9g=;
        b=hMf86iPvd4jRJ1B/h2KJs1eLB1MUT0+uNoY6yXN0MDypRy+5C7KXWvdhQceoxlp7Ub
         HJ4w6U3fyS3vcXi1BlvnwiHM2c4/jAx696ppcwsCQmbdeYRuSqh38L4OxuTzLte/o+O+
         RR5pwSsOyKMUMCEVtR6LyNWiwwEqsI6t3hCXUpD8LZtPCwacLWvfoSzKgg9KwTA8yOU6
         +sILF3X9p+76QTCmohbsnv+2IOOEGDSh21ReUieiM9cnjPHbr84VzoqSREWdX0afV22P
         qtIPKjwcwW+9NKoI4UzTqUttrGfis/4lUpNYn+CWKHQ2WATLA8vhb0mdBuEAqL1I+bmS
         vmkA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMjVtOzoai5tko0kgxUWaZvL530flC3tdzHIfFy1lEKN4HGH+NkMQMSzBhdtpNee8Xj9NZMq8SyhJDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys5qmtc8RLQ+ZpCtFmiE4uqJMDg4dCtWeY2ek4/pbxpzTWRuAF
	csIsjcEWRf7twnSxPff/XjCOU9gy8BYFpETM8p0DijOWdPMwaIgUOY4Svm0FSPSREmceTAVf9IB
	9pS/iTYgfTjCLUsRXbZbQGWZBtV5zTo4=
X-Gm-Gg: AY/fxX4oDLJB7UfACjAQdNfy1SR73C8f+b4PUyBJM+cFMupZcjpzJEYJPvuH0ta5tOi
	FsQX3qLsqCjS0QsIIoioJ0m4kL2DpotD3XLIcRSVGg1EI1BauD+NyVeu2KIaUNyEJhGMi7anAY5
	hpyfn5lkEOOlDG1fskGqnZXdnVimXJBhodq5u5+ZZ+/P+0grp0seLOAeLoqsyCOJBnBUDPrM2Tn
	nzFzmxNlYvA/RuAUzN2T/Bir6Xf5GsOFx6d4jy9U8GIhCMCPwZtet1h6X3StcI3SDAc6Lwv64Q=
X-Google-Smtp-Source: AGHT+IEQpU2uHORHsSaJvH+4Kc5a7FmzNED+x1TC212I/IRWbm5lKmfSyUpFZx/jrL2TYMouTF4PT26t1Et1Fqe+jxo=
X-Received: by 2002:a05:690e:4184:b0:644:43f7:11b8 with SMTP id
 956f58d0204a3-6466a844038mr2341085d50.13.1766156080207; Fri, 19 Dec 2025
 06:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
 <875xa2g0m0.fsf@igel.home> <5070743.31r3eYUQgx@7950hx> <1948844.tdWV9SEqCh@7950hx>
 <87cy4aeg56.fsf@igel.home> <CADxym3Y098836fHHRSjeryxCp=CPB8sDU19TBBVs07VZOERJXw@mail.gmail.com>
 <878qeyedaw.fsf@igel.home>
In-Reply-To: <878qeyedaw.fsf@igel.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 19 Dec 2025 22:54:28 +0800
X-Gm-Features: AQt7F2qQ1ufef4ZaQXp8N9zw3HgOD1aYzUQ6NsLMEQPkiIIuUt3G0BCDsWRcz7k
Message-ID: <CADxym3ZSHtqAn+_6pKEO+95tRp13eRCUuPqCfcM=xqMbhcf3PA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Menglong Dong <menglong.dong@linux.dev>, ast@kernel.org, rostedt@goodmis.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, mathieu.desnoyers@efficios.com, jiang.biao@linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_065441_570781_9BEA93D6 
X-CRM114-Status: GOOD (  10.28  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTA6NTDigK9QTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2Fi
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IE9uIERleiAxOSAyMDI1LCBNZW5nbG9uZyBEb25n
IHdyb3RlOgo+Cj4gPiBAQCAtMTE3MSw2ICsxMTY3LDggQEAgc3RhdGljIGludCBfX2FyY2hfcHJl
cGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QKPiA+IGJwZl90cmFtcF9pbWFnZSAqaW0sCj4gPiAg
ICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIGlmIChmbGFncyAmIEJQRl9UUkFNUF9GX0NBTExfT1JJ
Rykgewo+ID4gKyAgICAgICAgICAgICAgIC8qIHNraXAgdG8gYWN0dWFsIGJvZHkgb2YgdHJhY2Vk
IGZ1bmN0aW9uICovCj4gPiArICAgICAgICAgICAgICAgb3JpZ19jYWxsICs9IFJWX0ZFTlRSWV9O
SU5TTlMgKiA0Owo+Cj4gQmVmb3JlIHRoaXMgbGluZSwgb3JpZ19jYWxsIHN0aWxsIGNvbnRhaW5z
IHRoZSBzYW1lIHZhbHVlIGFzIGZ1bmNfYWRkciwKPiB3aXRoIHRoZSBsYXR0ZXIgYmVpbmcgZGVh
ZCwgc28gdGhlcmUgaXMgbm90IG11Y2ggcG9pbnQgaW4gdXNpbmcgYSBjb3B5LgoKWWVhaCwgd2Ug
Y2FuIHVzZSAiZnVuY19hZGRyICsgUlZfRkVOVFJZX05JTlNOUyAqIDQiIGhlcmUgZGlyZWN0bHku
Cgo+Cj4gLS0KPiBBbmRyZWFzIFNjaHdhYiwgc2Nod2FiQGxpbnV4LW02OGsub3JnCj4gR1BHIEtl
eSBmaW5nZXJwcmludCA9IDc1NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3ODAg
QTlEQSBBRUMxCj4gIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4i
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
