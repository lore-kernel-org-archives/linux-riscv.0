Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8557CEEAA58
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GJs+NY3F4OnsoH3cixcUVnI55CMzirHRytL8+VfsIs=; b=AIvRR8LFNJ8Did
	+wobw5nKH5JSM0ThEinZuRsTqwCq80xTTWqGLCiGYVTZtHXyeVQv3qEqYu5c7Q0CCjzsNae9q2qdB
	ak5X72DC1CSSeRNyKccwBsAn6V56k3eTbtf50ppT2vUVn8FVkZBjr3RvBAUuc+LttN9zGPbTe67l3
	iN4EuLipob4eUvooaM5k8eurUcteuvLKMQVfkWV1XGdczY/Jh8+jwheGXfZEiUWzpF1kgeSWSnYzg
	AV3a7mQqwfM2htpqE6RET/PkPDfTSUN7/CvmQlHBlNME1gY+DrVHHNx/07IsG3MeasibbslKCxYog
	rSjaz3hELD/USXVduByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpLM-008vEm-1v;
	Thu, 14 Sep 2023 16:37:28 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpLJ-008vDr-1S
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:37:27 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b974031aeaso19308251fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 09:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694709442; x=1695314242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INzY5mzDJkNITQ5vOtkJ6OyVulyDxlKzw3k+lMybVJM=;
        b=SqZX6sRWXV1B46vM9mqh7Wt+QkNDzog2RJboVAteApmaai0v0AV3EwUUC22Up7FTkv
         eMqQfWtHrUUwnwq05yNIFHrJ6Rp7MCpE1dors1XKiQcsvwd3dpJjQdf+DiCBxQDxri5M
         cCo2U8nnAq0byTmcBrGnLRg1YYJoOXNFo7O7my0ABYn2swuFZdASk5vN7Z+g5F7LsTOY
         2d5HXjN6AwGyeRHREqXgOm/NAu6uVt9NTMQ3gc2ZnUPvb1nM/YThty73isarnaITVK93
         iDZtjdmELBo8V7DZ5YQeImA0ex7rS64uK4f6YcniKQPv/1yRmByvhIZWlX7CqSjJOHxU
         gjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694709442; x=1695314242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INzY5mzDJkNITQ5vOtkJ6OyVulyDxlKzw3k+lMybVJM=;
        b=dUPT2ssZ6hIXkOQM1AY+/NoBbaCCDoh5DckWxXtjDdbfarN1HPK0hlfNeqmgmJC0C8
         MQF1jzrFz73KX2SvNIiGFq3OFtVX3vbfbYFe2ce76lXQfNIyuzNjDRKBYcFdX+vunYjG
         jZCtZlF6mg/ZZQQBmKNHAJ2BmVg9TyBgf3tzBzj5fFRFP4ZPtU0NLpN7kWKB7qW9ukZI
         H1TfLDA0lQ0SgaQo8d9zd+5ix6rmLTswTSoxPPFQamXJ4GJTb/KT8AyQvN/98NvGiegT
         flSQ7zE4BKq3kl/dXA1E96dSihX97Imw0igSIM6Nt8229xB2EQv6Xv7/jL+8UoRIOiWr
         dhNg==
X-Gm-Message-State: AOJu0YxYbqEouGmYp/ONCDsm9W40bwksMfc87VHhpik+Beuie4UHP1SH
	/ARCPE+WLjvGUrCKQislVMZcHnrqf0eXc+mK09SHSQ==
X-Google-Smtp-Source: AGHT+IGXhAInxFKQbKfHLY9/qgI04l1AFAvp7t0z7LIBOucUx5X+JWNDSTLpNWQ3GuOUiWNkbDCKY1C8vRn4pJDvDqg=
X-Received: by 2002:a2e:9455:0:b0:2bc:c11c:4471 with SMTP id
 o21-20020a2e9455000000b002bcc11c4471mr5726081ljh.21.1694709441979; Thu, 14
 Sep 2023 09:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
 <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
 <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com>
 <de95229a14614198894a8ce421c30d94@AcuMS.aculab.com> <CALs-Hstcz3OAxUi80nm+U0R56VBUUPQT=+XMOLpVJsn2ZOcM1A@mail.gmail.com>
 <172bc43cc2ac45239ec40477d53d263a@AcuMS.aculab.com>
In-Reply-To: <172bc43cc2ac45239ec40477d53d263a@AcuMS.aculab.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 14 Sep 2023 09:36:45 -0700
Message-ID: <CALs-HsvMfrsPsG2b9imLNOJFH6Xk45G0=UPWGtExePiMKV6+1Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: David Laight <David.Laight@aculab.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Marc Zyngier <maz@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Simon Hosie <shosie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_093725_491220_5B84FA99 
X-CRM114-Status: GOOD (  50.50  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgODo1NeKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRXZhbiBHcmVlbgo+ID4gU2VudDogMTQg
U2VwdGVtYmVyIDIwMjMgMTY6MDEKPiA+Cj4gPiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCAxOjQ3
4oCvQU0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbgo+ID4gPiA+IFNlbnQ6IDE0IFNlcHRlbWJl
ciAyMDIzIDA4OjMzCj4gPiA+IC4uLgo+ID4gPiA+ID4gPiAgICAgcnpmaXZlOgo+ID4gPiA+ID4g
PiAgICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdv
cmQgYWNjZXNzIGlzCj4gPiA+ID4gPiA+IDEuMDUsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgZmFz
dAo+ID4gPiA+ID4KPiA+ID4gPiA+IEhybSwgSSdtIGEgbGl0dGxlIHN1cnByaXNlZCB0byBiZSBz
ZWVpbmcgdGhpcyBudW1iZXIgY29tZSBvdXQgc28gY2xvc2UKPiA+ID4gPiA+IHRvIDEuIElmIHlv
dSByZWJvb3QgYSBmZXcgdGltZXMsIHdoYXQga2luZCBvZiB2YXJpYW5jZSBkbyB5b3UgZ2V0IG9u
Cj4gPiA+ID4gPiB0aGlzPwo+ID4gPiA+Cj4gPiA+ID4gUm9jay1zb2xpZCBhdCAxLjA1IChldmVu
IHdpdGggaW5jcmVhc2VkIHJlc29sdXRpb246IDEuMDU4NTMgb24gMyB0cmllcykKPiA+ID4KPiA+
ID4gV291bGQgdGhhdCBtYXRjaCB6ZXJvIG92ZXJoZWFkIHVubGVzcyB0aGUgYWNjZXNzIGNyb3Nz
ZXMgYQo+ID4gPiBjYWNoZSBsaW5lIGJvdW5kYXJ5Pwo+ID4gPiAoSSBjYW4ndCByZW1lbWJlciB3
aGV0aGVyIHRoZSB0ZXN0IGlzIHVzaW5nIGluY3JlYXNpbmcgYWRkcmVzc2VzLikKPiA+Cj4gPiBZ
ZXMsIHRoZSB0ZXN0IGRvZXMgdXNlIGluY3JlYXNpbmcgYWRkcmVzc2VzLCBpdCBjb3BpZXMgYWNy
b3NzIDQgcGFnZXMuCj4gPiBXZSBzdGFydCB3aXRoIGEgd2FybXVwLCBzbyBjYWNoaW5nIGVmZmVj
dHMgYmV5b25kIEwxIGFyZSBsYXJnZWx5IG5vdAo+ID4gdGFrZW4gaW50byBhY2NvdW50Lgo+Cj4g
VGhhdCBzZWVtcyBlbnRpcmVseSBleGNlc3NpdmUuCj4gSWYgeW91IHdhbnQgdG8gYXZvaWQgZGF0
YSBjYWNoZSBpc3N1ZXMgKHdoaWNoIHByb2JhYmx5IGRvKQo+IHRoZW4ganVzdCByZXBlYXRpbmcg
YSBzaW5nbGUgYWNjZXNzIHdvdWxkIGFsbW9zdCBjZXJ0YWlubHkKPiBzdWZmaWNlLgo+IFJlcGVh
dGVkbHkgdXNpbmcgYSBzaG9ydCBidWZmZXIgKHNheSAyNTYgYnl0ZXMpIHdvbid0IGFkZAo+IG11
Y2ggbG9vcCBvdmVyaGVhZC4KPiBBbHRob3VnaCB5b3UgbWF5IHdhbnQgdG8gZG8gYSB0ZXN0IHRo
YXQgYXZvaWRzIHRyYW5zZmVycwo+IHRoYXQgY3Jvc3MgY2FjaGUgbGluZSBhbmQgZXNwZWNpYWxs
eSBwYWdlIGJvdW5kYXJpZXMuCj4gRWl0aGVyIG9mIHRob3NlIGNvdWxkIGVhc2lseSBiZSBtdWNo
IHNsb3dlciB0aGFuIGEgcmVhZAo+IHRoYXQgaXMgZW50aXJlbHkgd2l0aGluIGEgY2FjaGUgbGlu
ZS4KCldlIHdvbid0IGJlIGZhdWx0aW5nIG9uIGFueSBvZiB0aGVzZSBwYWdlcywgYW5kIHRoZXkg
c2hvdWxkIHJlbWFpbiBpbgp0aGUgVExCLCBzbyBJIGRvbid0IGV4cGVjdCBtYW55IHBhZ2UgYm91
bmRhcnkgc3BlY2lmaWMgZWZmZWN0cy4gSWYKdGhlcmUgaXMgYSBzdGVlcCBwZW5hbHR5IGZvciBt
aXNhbGlnbmVkIGxvYWRzIGFjcm9zcyBhIGNhY2hlIGxpbmUsCnN1Y2ggdGhhdCBpdCdzIHdvcnNl
IHRoYW4gZG9pbmcgYnl0ZSBhY2Nlc3NlcywgSSB3YW50IHRoZSB0ZXN0IHJlc3VsdHMKdG8gYmUg
ZGluZ2VkIGZvciB0aGF0LgoKPgo+IC4uLgo+ID4gPiA+ID4gPiAgICAgdmV4cmlzY3Yvb3Jhbmdl
Y3JhYjoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRl
IGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2VzcyBpcwo+ID4gPiA+ID4gPiAwLjAw
LCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3cKPiA+ID4gPgo+ID4gPiA+IGNwdTA6IFJhdGlv
IG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQgYWNjZXNzIGlzIDAuMDA0MTcs
Cj4gPiA+ID4gdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4gPiA+ID4KPiA+ID4gPiA+ID4g
SSBhbSBhIGJpdCBzdXJwcmlzZWQgYnkgdGhlIG5lYXItemVybyB2YWx1ZXMuICBBcmUgdGhlc2Ug
ZXhwZWN0ZWQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBjb3VsZCBiZSBleHBlY3RlZCwgaWYg
ZmlybXdhcmUgaXMgdHJhcHBpbmcgdGhlIHVuYWxpZ25lZCBhY2Nlc3Nlcwo+ID4gPiA+ID4gYW5k
IGNvbWluZyBvdXQgPjEwMHggc2xvd2VyIHRoYW4gYSBuYXRpdmUgYWNjZXNzLiBJZiB5b3UncmUg
aW50ZXJlc3RlZAo+ID4gPiA+ID4gaW4gZ2V0dGluZyBhIGxpdHRsZSBtb3JlIHJlc29sdXRpb24s
IHlvdSBjb3VsZCB0cnkgdG8gcHJpbnQgYSBmZXcgbW9yZQo+ID4gPiA+ID4gZGVjaW1hbCBwbGFj
ZXMgd2l0aCBzb21ldGhpbmcgbGlrZSAoc29ycnkgZ21haWwgbWFuZ2xlcyB0aGUgd2hpdGVzcGFj
ZQo+ID4gPiA+ID4gb24gdGhpcyk6Cj4gPiA+Cj4gPiA+IEknZCBleHBlY3Qgb25lIG9mIHRocmVl
IHBvc3NpYmxlIHZhbHVlczoKPiA+ID4gLSAxLjB4OiBCYXNpY2FsbHkgemVybyBjb3N0IGV4Y2Vw
dCBmb3IgY2FjaGUgbGluZS9wYWdlIGJvdW5kYXJpZXMuCj4gPiA+IC0gfjI6IEhhcmR3YXJlIGRv
ZXMgdHdvIHJlYWRzIGFuZCBtZXJnZXMgdGhlIHZhbHVlcy4KPiA+ID4gLSA+MTAwOiBUcmFwIGZp
eGVkIHVwIGluIHNvZnR3YXJlLgo+ID4gPgo+ID4gPiBJJ2QgdGhpbmsgdGhlICcyJyBjYXNlIGNv
dWxkIGJlIGNvbnNpZGVyZWQgZmFzdC4KPiA+ID4gWW91IG9ubHkgbmVlZCB0byB0aW1lIG9uZSBh
Y2Nlc3MgdG8gc2VlIGlmIGl0IHdhcyBhIGZhdWx0Lgo+ID4KPiA+IFdlJ3JlIGNvbXBhcmluZyBt
aXNhbGlnbmVkIHdvcmQgYWNjZXNzZXMgd2l0aCBieXRlIGFjY2Vzc2VzIG9mIHRoZQo+ID4gc2Ft
ZSB0b3RhbCBzaXplLiBTbyAxLjAgbWVhbnMgYSBtaXNhbGlnbmVkIGxvYWQgaXMgYmFzaWNhbGx5
IG5vCj4gPiBkaWZmZXJlbnQgZnJvbSA4IGJ5dGUgbG9hZHMuIFRoZSBnb2FsIHdhcyB0byBoZWxw
IHBlb3BsZSB0aGF0IGFyZQo+ID4gZm9yY2VkIHRvIGRvIG9kZCBsb2FkcyBhbmQgc3RvcmVzIGRl
Y2lkZSB3aGV0aGVyIHRoZXkgYXJlIGJldHRlciBvZmYKPiA+IG1vdmluZyBieSBieXRlcyBvciBi
eSBtaXNhbGlnbmVkIHdvcmRzLiAoSW4gY29udHJhc3QsIHRoZSBhbnN3ZXIgdG8KPiA+ICJzaG91
bGQgSSBkbyBhIG1pc2FsaWduZWQgd29yZCBsb2FkIG9yIGFuIGFsaWduZWQgd29yZCBsb2FkIiBp
cwo+ID4gZ2VuZXJhbGx5IGFsd2F5cyAiZG8gdGhlIGFsaWduZWQgb25lIGlmIHlvdSBjYW4iLCBz
byBjb21wYXJpbmcgdGhvc2UKPiA+IHR3byB0aGluZ3MgZGlkbid0IHNlZW0gYXMgdXNlZnVsKS4K
Pgo+IEFoLCBJJ2QgaGF2ZSBjb21wYXJlZCB0aGUgY29zdCBvZiBhbGlnbmVkIGFjY2Vzc2VzIHdp
dGggbWlzYWxpZ25lZCBvbmVzLgo+IFRoYXQgd291bGQgdGVsbCB5b3Ugd2hldGhlciB5b3UgcmVh
bGx5IG5lZWQgdG8gYXZvaWQgdGhlbS4KPiBUaGUgY29zdCBvZiBieXRlIGFuZCBhbGlnbmVkIHdv
cmQgYWNjZXNzZXMgc2hvdWxkIGJlIG11Y2ggdGhlIHNhbWUKPiAoZm9yIGVhY2ggYWNjZXNzIHRo
YXQgaXMpIC0gaWYgbm90IHlvdSd2ZSBnb3QgYSByZWFsIGJvdHRsZW5lY2suCj4KPiBJZiBhIG1p
c2FsaWduZWQgYWNjZXNzIGlzIDggdGltZXMgc2xvd2VyIHRoYW4gYW4gYWxpZ25lZCBvbmUKPiBp
dCBpcyBzdGlsbCAncXVpdGUgc2xvdycuCj4gSSdkIGRlZmluaXRlbHkgY2FsbCB0aGF0IDggbm90
IDEgLSBldmVuIGlmIHlvdSB0cmVhdCBpdCBhcyAnZmFzdCcuCgpUaGUgbnVtYmVyIGl0c2VsZiBp
c24ndCBleHBvcnRlZCBvciBzYXZlZCBhbnl3aGVyZSwgaXQncyBqdXN0IHByaW50ZWQKYXMgZGlh
Z25vc3RpYyBleHBsYW5hdGlvbiBpbnRvIHRoZSBmaW5hbCBmYXN0L3Nsb3cgZGVzaWduYXRpb24u
CgpNaXNhbGlnbmVkIHdvcmQgbG9hZHMgYXJlIG5ldmVyIGdvaW5nIHRvIGJlIGZhc3RlciB0aGFu
IGFsaWduZWQgb25lcywKYW5kIGFyZW4ndCByZWFsbHkgZ29pbmcgdG8gYmUgZXF1YWwgZWl0aGVy
LiBJdCdzIGFsc28gZ2VuZXJhbGx5IG5vdApzb21ldGhpbmcgdGhhdCBjYXVzZXMgc29mdHdhcmUg
YSBsb3Qgb2YgYW5nc3Q6IHdlIGFsaWduIG1vc3Qgb2Ygb3VyCmJ1ZmZlcnMgYW5kIHN0cnVjdHVy
ZXMgd2l0aCBoZWxwIGZyb20gdGhlIGNvbXBpbGVyLCBhbmQgZ2VuZXJhbGx5IGRvCmFuIGFsaWdu
ZWQgYWNjZXNzIHdoZW5ldmVyIHBvc3NpYmxlLiBJdCdzIHRoZSB0aW1lcyB3aGVuIHdlJ3JlIGZv
cmNlZAp0byBkbyBvZGQgc2l6ZXMgb3IgYWNjZXNzZXMgd2Uga25vdyBhcmUgYWxyZWFkeSBtaXNh
bGlnbmVkIHRoYXQgdGhpcwpod3Byb2JlIGJpdCB3YXMgZGVzaWduZWQgdG8gaGVscC4gSW4gdGhv
c2UgY2FzZXMsIHVzZXJzIGFyZSBmb3JjZWQgdG8KZGVjaWRlIGlmIHRoZXkgc2hvdWxkIGRvIGEg
bWlzYWxpZ25lZCB3b3JkIGFjY2VzcyBvciBieXRlIGFjY2Vzc2VzLCBzbwp3ZSBhaW0gdG8gcHJv
dmlkZSB0aGF0IHJlc3VsdC4KCklmIHRoZXJlJ3MgYSB1c2UgY2FzZSBmb3Iga25vd2luZyAibWlz
YWxpZ25lZCBhY2Nlc3NlcyBhcmUgZXhhY3RseSBhcwpmYXN0IGFzIGFsaWduZWQgb25lcyIsIHdl
IGNvdWxkIGRldGVjdCB0aGlzIHRocmVzaG9sZCBpbiB0aGUgc2FtZQp0ZXN0LCBhbmQgYWRkIGFu
b3RoZXIgaHdwcm9iZSBiaXQgZm9yIGl0LgoKLUV2YW4KCj4KPiBGb3IgY29tcGFyaXNvbiB5b3Ug
KHdlbGwgSSkgY2FuIHdyaXRlIHg2NC02NCBhc20gZm9yIHRoZSBpcC1jaGVja3N1bQo+IGxvb3Ag
dGhhdCB3aWxsIGV4ZWN1dGUgMSBtZW1vcnkgcmVhZCBldmVyeSBjbG9jayAoOCBieXRlcy9jbG9j
aykuCj4gSXQgaXMgdmVyeSBzbGlnaHRseSBzbG93ZXIgZm9yIG1pc2FsaWduZWQgYnVmZmVycywg
YnV0IGJ5IGxlc3MKPiB0aGFuIDEgY2xvY2sgcGVyIGNhY2hlIGxpbmUuCj4gVGhhdCdzIHdoYXQg
SSdkIGNhbGwgMS4wIDotKQo+Cj4gSSdkIGV4cGVjdCBldmVuIHNpbXBsZSBoYXJkd2FyZSB0byBk
byBtaXNhbGlnbmVkIHJlYWRzIGFzIHR3bwo+IHJlYWRzIGFuZCB0aGVuIG1lcmdlIHRoZSBkYXRh
IC0gc28gc2hvdWxkIHJlYWxseSBiZSBubyBzbG93ZXIKPiB0aGFuIHR3byBzZXBhcmF0ZSBhbGln
bmVkIHJlYWRzLgo+IFNpbmNlIHlvdSdkIGV4cGVjdCBhIGNwdSB0byBkbyBhbiBMMSBkYXRhIGNh
Y2hlIHJlYWQgZXZlcnkgY2xvY2sKPiAocHJvYmFibHkgcGlwZWxpbmVkKSB0aGUgbWlzYWxpZ25l
ZCByZWFkIHNob3VsZCBqdXN0IGFkZCAxIGNsb2NrLgo+Cj4gICAgICAgICBEYXZpZAo+Cj4gLQo+
IFJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBN
aWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSwo+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
