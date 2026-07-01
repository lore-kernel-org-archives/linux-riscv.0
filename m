Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB15C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMPi8YumCIVo1wVcvkDnpiAqxL7hjsa6x3Ezt1OMjxc=; b=F19sTJx5kg2/ke
	ZwUeTJRQ5qCO79IGDyne/ZbHIeIVNDV3izq7Q1PLPeyqYc33oKrTgcfzCQQWw1/r30b+wDyzxTxge
	NLdtFojfhWLCrk+MpKb+SOcg2x85H6+JN5YLBEDCJ62l1bP17ZNdAs29iVGLML8jLbkSWEGuFOchz
	Bs8gKY311uIndbnSmEv69Hfichj+cEBkIEh9curNnItKUc4mzFE0XzJgwZ4GMDBotTFAxnEf07cXL
	amhoA9U4vxHwwHB5iu0xLdXnzHzPc4U9qq1Rae2P+lQCpgTb7hARPljCEjPYGucN7AYvQMihWGMds
	qELJfIV0Bi3FC3keeMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welM7-00000000Yrx-0Z8c;
	Wed, 01 Jul 2026 03:11:20 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welM2-00000000YrM-3Aqa
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 03:11:16 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e9f6b94a49so112477a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 20:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782875474; cv=none;
        d=google.com; s=arc-20260327;
        b=dXRQNbDiBHtE1PWb7+lmw+Gw8GO4XKV9sJTH4so2xuySZGEcOZxfqwAmjdgCdKeyrp
         bJWNPIapcKV9n6zNIUs93FwmoQms0KEV/eie2JvEujBcQTWhjyFMmspN5XqDad2WfOCO
         JnzDloRKoowtGjg+I+eJu7bRJZpSE6IOMHG8gLGV1WVD3Tmt5Hf/zu6gyL5NfU5xTM6y
         0gvt/G+wbdd+5qL9/lJSmYp0JKB3/ggooMSpnxx2oIM5pAhglOhFm5MlLpvsQeJ2tnSL
         nPfClI2HC118LHKaXhZTUaj1GSeeiHhsGplz9EsrFLZo0FXuGBPrL2NRwFoWMbaSzCdK
         u0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AW+XVWe2JL0df9uuAdxaZgi837urm1REze6zO62j7wg=;
        fh=bSa4xwDZDyBahHTN5b92qne2KZk5sGdumxpciwmjnj4=;
        b=Uw9MN0MFWNn0mBcwbmDTIeDzERuJzwKboS47SBCHZ9MgAuXij+ifYZHxufsLrzAuj9
         bNSmN1utSVCyQS6JjOBqinzP6FeE4RcpU6D4WWJD2KSQO+NbvNmekwirkKGk938ORH9L
         faCK5rnxDxvKdJ79aetSejNU/gK9R/sCdbDze7AnjcqSuxLDqMxVyag57VrtQRA23Vdh
         gQgbODWiH5ow7RjgtYVwvMC5mzyLQTmF+XlsmwuInU73ahXoyssJeKEoQRbk7x+xcKdl
         8YBfIa+HQv+B0dJfm9dmjxh+SOBb6oD1hfqiBOK9pUoCSj6QLBMxJNm/SHZeFRuZ0Z4x
         4x4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782875474; x=1783480274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW+XVWe2JL0df9uuAdxaZgi837urm1REze6zO62j7wg=;
        b=awVlXO+/+jCSROycfU9GlZ2xGiXhidta8rpDqD5dyvu/zkdTLw9oip/QsVALP/+AVu
         KTMy4jJpndARFPJwnsIUaWTwd+dHOU88+rL2gxBKc6LpOBKiTe6UH5BUNRHkOFXH45wP
         5a31m6ZZz1/Qws8x+lOpk+RuPLdujm0kVEg6UNScgo7LcAt0RJq21vFc29xmM6xy1Dhr
         6utxii01SFu4DyyCGWZLAwjguuIDt1J2HtOmdVip7gAh2xc6ToDaIlwYDejpk9UzUwyd
         tYvIvOfavNRM3oi/WBz75ThTN8Vu81A3dNa+s3cFPnr79IazDWiotKgwpqbDBvc2d3vp
         HBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782875474; x=1783480274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AW+XVWe2JL0df9uuAdxaZgi837urm1REze6zO62j7wg=;
        b=osoqahJFt8aprIcxES+4gLUkSLgr/pEaHFBRsbhP3LtzwhHzzA376Fg2S3PUfd3c8j
         XERD2IDDidazvYrt5RpJlUCw0+PJ/P32n8wHSOG15ok60UKfWsokvGKKU19Kt0ZM1PJX
         /3FLwFYa9wWjDHtm1MCVhXNQtxHX6qKEqjAJPp3fui2x24TVWET4QlXbJl36wigwNF9x
         X82V/oxijPi3yCLsOTCQwAD9QjobtdL3dJA9zuth1jA7rREGMrCukEbM3SYoiDDMS+Hc
         VGaFJS+s/MDcxnlJ9V61NBhTLTYPvmDPFft5fc5YqhFffxuz4nwi7FARHqf+qMGjkAZu
         zQJw==
X-Forwarded-Encrypted: i=1; AFNElJ9l4+EU2WyC5cfj1ghwShnIVZFg3SxYcz7vtwjnJG1EjCjEpU5QbiyqxCTVp2Brg3Y5FSmeuELrIbffSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9cNCkBfZsDX+8rorByE88e+ZmgOJAzlHFDl3DYV3IAYad9oDL
	aoyfaq/Tii0/pYocr8AHUGQYtpIHQOpq0PuboXhOkk7mjQWVT0gkJwTPvo7Ue27cfgJ+3ibmCFD
	zdNSKKEsyPGfpCKgepwY45try310a4eSQT6kU40Jasg==
X-Gm-Gg: AfdE7cn2K0D4Wm8vJ3oPzaAPn7P64Tbkgjv/7hX6OLGuI0yUQN/+uz8YPjY0vK9JiOD
	8eNIGSVwt1uQUvYjDwlx7h7PX9OpTzt2TahEXMsmK0XJex4WKsSL3yN/O7XC7VfOMXNJ9YusRHQ
	Hu+o155tvnaHPMCDGHDTmi0s/Hj+gHmqRHfwXyv4ZN4KI2TSrGfN4SWbR38GkP2W+FrekYcZsaB
	k+vDV56vsvflqycwwy0VzU4DNRLmpOZzUd3jXHszbcbCLBwOEXJd42k23oZgFSt9MRUsD7Ddgs=
X-Received: by 2002:a05:6830:4901:b0:7dc:c4ae:a689 with SMTP id
 46e09a7af769-7e9ec586d01mr4829708a34.2.1782875473497; Tue, 30 Jun 2026
 20:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260505062026.91724-1-cuiyunhui@bytedance.com>
 <20260505062026.91724-2-cuiyunhui@bytedance.com> <3720c3a4-cc0d-4ba8-97ae-35def0189e2e@app.fastmail.com>
In-Reply-To: <3720c3a4-cc0d-4ba8-97ae-35def0189e2e@app.fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 11:11:02 +0800
X-Gm-Features: AVVi8CfCZ39PlUVHuhvVesQ30Ayu5byi3NLY-dGR5ZLniizemgTSehNq4vDg6QE
Message-ID: <CAEEQ3wn8AFVqWZAiXfQd4a1ZzH=2L8qRX4W3S=KcmQ5FORjn+Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/3] riscv: io: avoid null-pointer
 arithmetic in PIO helpers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, pulehui@huawei.com, 
	puranjay@kernel.org, Thomas Huth <thuth@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Zong Li <zong.li@sifive.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Thomas Gleixner <tglx@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, seanwascoding@gmail.com, 
	Andy Chiu <andybnac@gmail.com>, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, qingfang.deng@siflower.com.cn, 
	Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_201114_862764_D28FEDCE 
X-CRM114-Status: GOOD (  26.58  )
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

SGkgQXJuZCwKCk9uIFR1ZSwgTWF5IDUsIDIwMjYgYXQgMjozNOKAr1BNIEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgNSwgMjAyNiwgYXQgMDg6MjAs
IFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBUaGUgUklTQy1WIFBJTyBoZWxwZXJzIGRlcml2ZSBJL08g
YWRkcmVzc2VzIGZyb20gUENJX0lPQkFTRSBpbiBpbnMqKCksCj4gPiBvdXRzKigpLCBhbmQgaW9w
b3J0X21hcCgpLgo+ID4KPiA+IFVuZGVyIGNvbmZpZ3VyYXRpb25zIHdoZXJlIEkvTyBwb3J0IHN1
cHBvcnQgaXMgbm90IGF2YWlsYWJsZSwgdGhlc2UKPiA+IGV4cHJlc3Npb25zIGNhbiBzdGlsbCBi
ZSBmb3JtZWQgZHVyaW5nIGNvbXBpbGF0aW9uIGFuZCB0cmlnZ2VyCj4gPiAtV251bGwtcG9pbnRl
ci1hcml0aG1ldGljIHdhcm5pbmdzIGZyb20gY2xhbmcuCj4KPiBJZiBhIGRyaXZlciBhdHRlbXB0
cyB0byB1c2UgSVNBIHBvcnQgb3BlcmF0aW9ucyBpbiBhIGNvbmZpZ3VyYXRpb24KPiB3aXRob3V0
IENPTkZJR19IQVNfSU9QT1JULCB0aGVyZSBpcyBhIE5VTEwgcG9pbnRlciB3YXJuaW5nIGJlY2F1
c2UKPiB0aGlzIGlzIGFjdHVhbGx5IGEgTlVMTCBwb2ludGVyIGFjY2VzcyB0aGF0IHdpbGwgY3Jh
c2ggdGhlCj4ga2VybmVsIGlmIHRoZSBkcml2ZXIgaXMgZXZlciBsb2FkZWQuIFlvdSBzaG91bGQg
bm90IGF0dGVtcHQKPiB0byBzaHV0IHVwIHRoZSB1c2VmdWwgd2FybmluZyBoZXJlIGJ1dCBpbnN0
ZWFkIG1ha2Ugc3VyZSBldmVyeQo+IHN1Y2ggY29kZSBoYXMgYSBwcm9wZXIgJ2RlcGVuZHMgb24g
SEFTX0lPUE9SVCcgZGVwZW5kZW5jeS4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkkgYWdyZWUg
dGhhdCBOVUxMLXBvaW50ZXIgYXJpdGhtZXRpYyB3YXJuaW5ncyBjYW4gcG9pbnQgdG8gcmVhbCBt
aXNzaW5nCkhBU19JT1BPUlQgZGVwZW5kZW5jaWVzIGluIGRyaXZlcnMsIGFuZCB3ZSBzaG91bGQg
bm90IGhpZGUgdGhvc2UgZ2xvYmFsbHkuCgpZb3UgYXJlIHJpZ2h0IGFib3V0IHRoZSBnZW5lcmlj
IGlvcG9ydF9tYXAoKSBjaGFuZ2U6IHRoZSBoZWxwZXIgaXMgYWxyZWFkeQpndWFyZGVkIGJ5IENP
TkZJR19IQVNfSU9QT1JUX01BUCwgc28gdGhlIGV4dHJhIENPTkZJR19IQVNfSU9QT1JUIGNoZWNr
IGlzCnJlZHVuZGFudC4gSSB3aWxsIGRyb3AgdGhhdCBjaGFuZ2UuCgpGb3IgdGhlIFJJU0MtViBp
bnMqL291dHMqIGhlbHBlcnMsIHRoZXkgdXNlIFBJTy1zcGVjaWZpYyBmZW5jZXMKKF9faW9fcGJy
KCkvX19pb19wYXIoKSBhbmQgX19pb19wYncoKS9fX2lvX3BhdygpKSwgd2hpbGUgdGhlIGFzbS1n
ZW5lcmljCmhlbHBlcnMgd291bGQgZ28gdGhyb3VnaCByZWFkc2IoKS93cml0ZXNiKCkgYW5kIHVz
ZSBub3JtYWwgTU1JTyBzdHJpbmcKb3JkZXJpbmcuIFNvIHJlbW92aW5nIHRoZW0gd291bGQgY2hh
bmdlIG9yZGVyaW5nIHNlbWFudGljcy4KCkkgd2lsbCBrZWVwIHRoZSBSSVNDLVYgaGVscGVycyBm
b3Igbm93IGFuZCBvbmx5IGd1YXJkIHRoZSBwb3J0LUkvTwp2YXJpYW50cyB3aXRoIENPTkZJR19I
QVNfSU9QT1JULgoKPgo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX0hBU19JT1BPUlQKPiA+ICBfX2lv
X3JlYWRzX2lucyhpbnMsICB1OCwgYiwgX19pb19wYnIoKSwgX19pb19wYXIoYWRkcikpCj4gPiAg
X19pb19yZWFkc19pbnMoaW5zLCB1MTYsIHcsIF9faW9fcGJyKCksIF9faW9fcGFyKGFkZHIpKQo+
ID4gIF9faW9fcmVhZHNfaW5zKGlucywgdTMyLCBsLCBfX2lvX3BicigpLCBfX2lvX3BhcihhZGRy
KSkKPiA+IC0jZGVmaW5lIGluc2IoYWRkciwgYnVmZmVyLCBjb3VudCkgX19pbnNiKFBDSV9JT0JB
U0UgKyAoYWRkciksIGJ1ZmZlciwgY291bnQpCj4gPiAtI2RlZmluZSBpbnN3KGFkZHIsIGJ1ZmZl
ciwgY291bnQpIF9faW5zdyhQQ0lfSU9CQVNFICsgKGFkZHIpLCBidWZmZXIsIGNvdW50KQo+ID4g
LSNkZWZpbmUgaW5zbChhZGRyLCBidWZmZXIsIGNvdW50KSBfX2luc2woUENJX0lPQkFTRSArIChh
ZGRyKSwgYnVmZmVyLCBjb3VudCkKPiA+ICsjZGVmaW5lIGluc2IoYWRkciwgYnVmZmVyLCBjb3Vu
dCkgX19pbnNiKFBDSV9JT19BRERSKGFkZHIpLCBidWZmZXIsIGNvdW50KQo+ID4gKyNkZWZpbmUg
aW5zdyhhZGRyLCBidWZmZXIsIGNvdW50KSBfX2luc3coUENJX0lPX0FERFIoYWRkciksIGJ1ZmZl
ciwgY291bnQpCj4gPiArI2RlZmluZSBpbnNsKGFkZHIsIGJ1ZmZlciwgY291bnQpIF9faW5zbChQ
Q0lfSU9fQUREUihhZGRyKSwgYnVmZmVyLCBjb3VudCkKPiA+ICsjZW5kaWYKPgo+IENhbiB5b3Ug
dHJ5IHRvIHJlbW92ZSB0aGUgY3VzdG9tIGFjY2Vzc29ycyBhbHRvZ2V0aGVyIGFuZAo+IHVzZSB0
aGUgb25lcyBmcm9tIGFzbS1nZW5lcmljIGluc3RlYWQ/IFRoZXNlIHNob3VsZCBhbHJlYWR5Cj4g
aGF2ZSB0aGUgY29ycmVjdCBiZWhhdmlvciBhbGwgdGhlIHRpbWUsIGluIHBhcnRpY3VsYXIgdGhl
eQo+IGFscmVhZHkgY29tZSB3aXRoIHRoZSBjb3JyZWN0ICNpZmRlZiBjaGVjayB0aGF0IGlzIGFw
cGFyZW50bHkKPiBtaXNzaW5nIGluIHRoZSByaXNjdiB2ZXJzaW9uLgo+Cj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCj4g
PiBpbmRleCBjYTVhMWNlNmYwZjg5Li5kNzk5ZTVjY2M5NDM3IDEwMDY0NAo+ID4gLS0tIGEvaW5j
bHVkZS9hc20tZ2VuZXJpYy9pby5oCj4gPiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgK
PiA+IEBAIC0xMjA1LDggKzEyMDUsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0KPiA+
ICppb3JlbWFwX25wKHBoeXNfYWRkcl90IG9mZnNldCwgc2l6ZV90IHNpemUpCj4gPiAgI2RlZmlu
ZSBpb3BvcnRfbWFwIGlvcG9ydF9tYXAKPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAq
aW9wb3J0X21hcCh1bnNpZ25lZCBsb25nIHBvcnQsIHVuc2lnbmVkCj4gPiBpbnQgbnIpCj4gPiAg
ewo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX0lPUE9SVAo+ID4gICAgICAgcG9ydCAmPSBJT19TUEFD
RV9MSU1JVDsKPiA+ICAgICAgIHJldHVybiAocG9ydCA+IE1NSU9fVVBQRVJfTElNSVQpID8gTlVM
TCA6IFBDSV9JT0JBU0UgKyBwb3J0Owo+ID4gKyNlbHNlCj4gPiArICAgICByZXR1cm4gTlVMTDsK
PiA+ICsjZW5kaWYKPiA+ICB9Cj4KPiBUaGUgZnVuY3Rpb24gZGVmaW5pdGlvbiBoZXJlIGlzIGd1
YXJkZWQgYnkgdGhlICNpZmRlZiBDT05GSUdfSEFTX0lPUE9SVF9NQVAKPiBjaGVjaywgd2hpY2gg
c2hvdWxkIGFscmVhZHkgcHJldmVudCBpdCBmcm9tIGJlaW5nIHZpc2libGUgd2hlbgo+IENPTkZJ
R19IQVNfSU9QT1JUIGlzIGRpc2FibGVkLgo+Cj4gICAgICBBcm5kCgpUaGFua3MsCll1bmh1aQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
