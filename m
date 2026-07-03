Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D942BC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMq4S1v4rdi8tKRwWQaVevqeMXLz+lXFkD2//zntrDk=; b=18bdgeFnp50wO7
	IdbZAwcXuKp8ar8cY/uZZxpgdox1ILge3oOxRZ8kfdVqS4ihPmtEADmHjUaaR+Lh5y4bls65lZy8d
	tfJBAHiAW5fGeOfhNnc4de3TAkOHwlOhPaGjnVkOUQcoYChvRb6bEGH73xGtySmukmBvxstUnOBZF
	TpHayHevRiJK0KWkLwtxMin7ueE5Iq5OilV46a9FXZ+Es2r6aivpR112G2rfHmTsHGg9pjgACTARz
	hk9OH5JtO3LMaczAqnFTA31n/JlO6vYII/swcOYeHRPMXYn8xcL4D91OLEEqNTIjYqDHLoaQ4/o6R
	57v0WFw/GcraeuiiEW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcz0-00000006vkx-2ujA;
	Fri, 03 Jul 2026 12:27:02 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcyx-00000006vkX-46kv
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 12:27:01 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-448cf99c133so1226500fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 05:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081616; cv=none;
        d=google.com; s=arc-20260327;
        b=Lq66Z+BeCGE14WxpJYHzco8vnI0fOf0StKqtMQSoGV2xgUU/sxm8GYSv+F7i324crV
         d5m7jHBtUDZWoHxMNwfXkpfKBiGaljK3EryXAx2vGnRCM7+osA5ZgHB/p204XWts2/3s
         7e2Gy3d9tM1R5v/AyL0w2E7SQ97z0L42BkNBTKZGmC0hYW8WUgElyhFlhVy8TY5vtYEg
         z+XYI7RyY4u5xoMaxChIgKS4PG8YdH0d1XMiyzLR9zRpuTjMZ1uUagVlwl7QseMxyzHV
         /6DbOIjqfR/BQ6dlDrjQdruD5qMe7dju2MHX8/tqXybsWh8gyrSOie/W6QqlIvswjzB5
         UHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mkcwegeSHRA8Rtq4C78mf0gL9tHt8vO0ljYRm2yfd08=;
        fh=NfWlleCo5AKnAT8duD8Jh8d+RIhzk0EKJPgRPv4tNAw=;
        b=GWbRee5+QQkjizfxXuOvvWQatknEe2xUIc60MU8gYV25gLfaxZydczaNAp+WEx0gZU
         XSEw/Pr8s1RD9NOLYsdw+umO39F0E6kdZF+ts4PpHlLQhsvhIvcQ+bc8RW7Fa09btNI4
         TnQZYJZXDTEzN4F53LePwwT/LPl9YlDB2Kp7P+f8C8CzL0yjxFdLVaPwPibNmS6KbUtn
         I7JIKogyrj3tmg8+OLQaJjYgBqIbnlPS8lPlovrQzBrRuHQakhDtInpC0R4lDukQDuYt
         TbRfKihthMZ5lf59IE6WrPFubqrjwVvN+nni9goLW69B2h8yP1j1Ek5UJv5kRZy4gpHA
         dGKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783081616; x=1783686416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkcwegeSHRA8Rtq4C78mf0gL9tHt8vO0ljYRm2yfd08=;
        b=BY7t6cSY6Ar9j0zPDDh8IM0oPkFE+7BGAP0pGCqhiFcnAMVQdibgM04d96hH9wwpcV
         e+lL1pyCWGB9h2lJg9Ut4+xAD2thrPJ/zwwhptEyWkdZbsijfSS/JFm5oOgmFh2kjbL8
         XDXlUimz/VnKSUvNu5nRGvH035Dpc7wO24OEqz01SvMhBZwSilfisaXb3zuyA7Uxg2oJ
         YjWdAKbqKgUfWQfyVYsX+EWr1Kc4cUaNwwZGw6SNJ0CHslDyIlSmC/nih+v6MVQnGPc0
         dKCLDhtZsiSS65pbXp9adyyloD8LEUs9BVSH9pdUignlFIxrlhRJ4P7W6YeCSMNpaY54
         8KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081616; x=1783686416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkcwegeSHRA8Rtq4C78mf0gL9tHt8vO0ljYRm2yfd08=;
        b=HTRBoiKM2RzYpdPCgC7rlNLj+hguMxWjqYYB7DB/6XDKQfbSXZ7T5x8LUOMQoU0aP0
         5OkcYYZbYsv3Ts4wkB3JP6p8o3dDDezZLuseT+GWeIK5ofhr64WqpL0NpnDzDeIPtWPx
         7IQiqRS7nOJub+a8Sqt7jQ/N8dvkVmQXj3+Skxtp3WJME0TZSR+BVkHKtftTzZt980YD
         WTHcweO7aHB+6VRZ05jz1sLMrEK5TGyojBR+ZaFie9zH9cPGC5gic91teGj8HlkMxPDZ
         FI+NzF+ajdbWaaQH7o0jM+5PjbVZpCBw3oK5MuK3XZzzFIykXe71UaNUX8inKeUdOA+s
         1A/w==
X-Forwarded-Encrypted: i=1; AFNElJ+LvJr4jrEMRCqGCFOZ+k6SOrULFBNxdfdDYU7aJwc1V/GNWT0tOiupVSoBU/ODFzmR2NHT2g2MLHYGLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kuODoVzL+q+Q1ys0nets5ODYH+GadNJWUvGjcNu8opbZrjR4
	Q2JeEzmL7FpzmcsM/bXPUkxfMt7mdlco6s1ozmbPls5BKYdXXa6h3hXJ9wxNWlSb/GdeGQ84ZSU
	UHt9eDOckmChezOFsHL32Wf9/4x8Yv1NYt4j7l5DzUQ==
X-Gm-Gg: AfdE7clxQk5aYLFrRwgEy1nFEtmLJqXs9BBReHknnO3+Hh+IspQFKXwVGkDtPuH4vSQ
	ga3tvN1y4/bgjq/ZyNjYpLlO7kazezyLEoeXikJa6hoEdWPLufAGCHw6QxVWrqgikies4243Z9I
	fjnfJBonoWrStc4jPlkYxjkbcj2qjgjYCcGAqrrfgtacC6AkZCXd1eBMTQwarha1OOBpwkr5MQ8
	xFxeqLUI0kcIAMJQbWdSu+3sLposdjtUF5wUzq/OnUM/yjO4jv2dbhLJwA3VTDMzBn1hy9hLLi3
	N4AmP1C1SOY6CA==
X-Received: by 2002:a05:6809:6:20b0:496:100e:35f8 with SMTP id
 5614622812f47-497e1e43cedmr1478072b6e.21.1783081615982; Fri, 03 Jul 2026
 05:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260702025443.83389-4-cuiyunhui@bytedance.com> <cee66b78b5bad62e6107ce7579d7e613ad05a258aef8d0ab279b706543651a13@mail.kernel.org>
In-Reply-To: <cee66b78b5bad62e6107ce7579d7e613ad05a258aef8d0ab279b706543651a13@mail.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 3 Jul 2026 20:26:44 +0800
X-Gm-Features: AVVi8CcDmMKspGUBCgXqug4CkmXz20IK78kFtcg22LCfN8fJHodpSJeX2_dNFaw
Message-ID: <CAEEQ3wmTJU1-5e81fy0wnv6gCP4n0cdydOW-Hj7pFJxhFj+6MA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 3/3] riscv: store percpu offset into thread_info
To: bot+bpf-ci@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	llvm@lists.linux.dev, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_052700_053915_F50060C0 
X-CRM114-Status: GOOD (  12.36  )
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

SGkgYm90K2JwZi1jaSwKCk9uIFRodSwgSnVsIDIsIDIwMjYgYXQgMTI6MDjigK9QTSA8Ym90K2Jw
Zi1jaUBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYXNtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oCj4gPiBpbmRleCBl
OWU4YmE4M2U2MzIuLjEzN2E0OTQ4ODMyNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYXNtLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKPiA+
IEBAIC05MSwxMSArOTEsNyBAQAo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX1NNUAo+ID4gIC5tYWNy
byBhc21fcGVyX2NwdSBkc3Qgc3ltIHRtcAo+ID4gLSAgICAgbHcgICAgXHRtcCwgVEFTS19USV9D
UFVfTlVNKHRwKQo+ID4gLSAgICAgc2xsaSAgXHRtcCwgXHRtcCwgUklTQ1ZfTEdQVFIKPiA+IC0g
ICAgIGxhICAgIFxkc3QsIF9fcGVyX2NwdV9vZmZzZXQKPiA+IC0gICAgIGFkZCAgIFxkc3QsIFxk
c3QsIFx0bXAKPiA+IC0gICAgIFJFR19MIFx0bXAsIDAoXGRzdCkKPiA+ICsgICAgIFJFR19MIFx0
bXAsIFRBU0tfVElfUENQVV9PRkZTRVQodHApCj4gPiAgICAgICBsYSAgICBcZHN0LCBcc3ltCj4g
PiAgICAgICBhZGQgICBcZHN0LCBcZHN0LCBcdG1wCj4gPiAgLmVuZG0KPgo+IFRoaXMgaXNuJ3Qg
YSBidWcsIGJ1dCBhc21fcGVyX2NwdSB3YXMgdGhlIG9ubHkgcmVhZGVyIG9mIFRBU0tfVElfQ1BV
X05VTSwKPiBhbmQgaXQgbm93IGxvYWRzIFRBU0tfVElfUENQVV9PRkZTRVQodHApIGluc3RlYWQu
Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+ID4gaW5kZXggYWY4Mjc0NDhhNjA5Li5mYmY1
M2I2NmIwZTAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCj4gPiBAQCAtMzgsNiAr
MzgsNyBAQCB2b2lkIGFzbV9vZmZzZXRzKHZvaWQpCj4gPiAgICAgICBPRkZTRVQoVEFTS19USFJF
QURfU1VNLCB0YXNrX3N0cnVjdCwgdGhyZWFkLnN1bSk7Cj4gPgo+ID4gICAgICAgT0ZGU0VUKFRB
U0tfVElfQ1BVLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8uY3B1KTsKPiA+ICsgICAgIE9GRlNF
VChUQVNLX1RJX1BDUFVfT0ZGU0VULCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8ucGNwdV9vZmZz
ZXQpOwo+ID4gICAgICAgT0ZGU0VUKFRBU0tfVElfUFJFRU1QVF9DT1VOVCwgdGFza19zdHJ1Y3Qs
IHRocmVhZF9pbmZvLnByZWVtcHRfY291bnQpOwo+ID4gICAgICAgT0ZGU0VUKFRBU0tfVElfS0VS
TkVMX1NQLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8ua2VybmVsX3NwKTsKPiA+ICAgICAgIE9G
RlNFVChUQVNLX1RJX1VTRVJfU1AsIHRhc2tfc3RydWN0LCB0aHJlYWRfaW5mby51c2VyX3NwKTsK
Pgo+IEEgdHJlZS13aWRlIHNlYXJjaCBub3cgZmluZHMgVEFTS19USV9DUFVfTlVNIG9ubHkgYXQg
aXRzIGRlZmluaXRpb24gaW4KPiBhc21fb2Zmc2V0cygpOgo+Cj4gICAgICAgICBPRkZTRVQoVEFT
S19USV9DUFVfTlVNLCB0YXNrX3N0cnVjdCwgdGhyZWFkX2luZm8uY3B1KTsKPgo+IHdpdGggbm8g
cmVtYWluaW5nIHVzZXJzIChUQVNLX1RJX0NQVSBpcyBhIHNlcGFyYXRlIHN5bWJvbCBzdGlsbCBy
ZWZlcmVuY2VkCj4gYnkgZW50cnkuUykuICBDb3VsZCB0aGlzIE9GRlNFVCgpIGxpbmUgYmUgZHJv
cHBlZCBhcyB3ZWxsPwoKIFRoYW5rcywgd2lsbCBmaXggaW4gdjguCgo+Cj4KPiAtLS0KPiBBSSBy
ZXZpZXdlZCB5b3VyIHBhdGNoLiBQbGVhc2UgZml4IHRoZSBidWcgb3IgZW1haWwgcmVwbHkgd2h5
IGl0J3Mgbm90IGEgYnVnLgo+IFNlZTogaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVz
L3ZtdGVzdC9ibG9iL21hc3Rlci9jaS9jbGF1ZGUvUkVBRE1FLm1kCj4KPiBDSSBydW4gc3VtbWFy
eTogaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9hY3Rpb25zL3J1bnMvMjg1
NjI0NTA5MzMKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
