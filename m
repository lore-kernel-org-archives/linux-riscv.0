Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF5BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Icoha5eHZU/KGVHjLcQcvpyvVy/4ZwweTMUkxfBhhqc=; b=GGE/Tqi3V7CUfX
	/OgjK+YHP9VaNy3GPc3AbDgNX1TbVCZ4I45RJdpZgS83/q+De5S5L+gIZKjKS0AqVc7fki9h1kjPZ
	s9+N301NQAFXIsjms2aUDL2yhAXyn3Tudi8L96JatBJ21RlyGm2Lir68t2GIbbQY/oQCms3FvvYWF
	Uyhn9/23lrEM2woc/BH4VEqEWeU+lE3ohQhQZj/7N6847FbswyN/q64sVm+9fneVQxE9KB4A+Uv0P
	nRVw59lVzUJ9T6md34+WTJ98EcMy5JR4nIV1Y4azRc8h40IN1DN9knCPoY0uVQsvoxVsnnB4+yZtY
	6IIn7NgOkAxRboaAiS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA88n-004u32-7r; Wed, 19 Jan 2022 10:24:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA88k-004u1u-Ig
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 10:24:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id n8so4361914wmk.3
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 02:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=23T4xOW2I0F1J8h1VBHMXa/Hl9U+ZT3rpxlsT4/aGfc=;
 b=YsEHE2FoxTIEDYdQkjHZoP/fMCSt7QDmBQ4JdVPHxM4mlnOCzYop6XchK4rNHKQtf+
 EB550obMnV3f5ZhHcIk/AxpQ8rIFuitjP2WoGDxLwZPMERXqneeB/TZ8sQCaB/Na7dAD
 gBFFTaU95S2gXYoC1ejMoGbHiqPSliY7DgwtbQkFJB0qfSMMdRfOMiiSSiPIlGi9YkfW
 SF6KUmqLmY0Vm9eUK4+qdupPRPxxj4ZT74ftdKfK9m/t115DOzfVBBOGbky0j7JF+4xS
 /laydDlP6PnfNM7FjGBWQC6AyMUnubEMwTk5FqFL60694tozYxQKd8zFSgAVHk04Owxb
 LpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=23T4xOW2I0F1J8h1VBHMXa/Hl9U+ZT3rpxlsT4/aGfc=;
 b=T2gvdjFzy86XC40HyvJaYVwn98xQDup9a9/CGioXsMsDBWm5xuixhfPl68M/CPGBQN
 2xRoJiGRY+8QWiiRCvmXAlqP+b0Pb4Wu1A82h0MiaYRQXAzKCoyUsc75nKDobpPTtueV
 smlwinW1RMcPOhCHAqYTW0PBgdBWpELnUbJctZIAlNbglgzkHFuDUV5Jcuvm9rrZCA74
 Hpl6KzNOTXbgsnoSesWiQ3F721b4ampNnx8YJDOHyZoAzHuOApn0qf2kkoBGQU6gaSqR
 NXdNQJK4hdKl8hh2VGqelCOHmyChi8fZIzf1w05Jco9nmSDpBqFvwzXyrpmIKKJnKSjR
 KzLQ==
X-Gm-Message-State: AOAM532LgQhOJ6bd6t473FSStuF/Wln10TuASCQsi7NCezYZvk6MUtoR
 m0o1xw2aFr3W/0+jJGK7sncSgsiXV2mom3LHWKJwouMNUz0=
X-Google-Smtp-Source: ABdhPJyQ5Tdq7m8t7iLiOJAS4JTEijMM4at1JFtGA1ZF2R8mUGyIx8zXbXyxAiL39Qfm4S+aXM2whQ60Ky+y/NvZSKQ=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr27706022wrh.384.1642587868723; 
 Wed, 19 Jan 2022 02:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20220110165208.1826-1-jszhang@kernel.org>
 <Ydxljv2Q4YNDYRTx@xhacker>
In-Reply-To: <Ydxljv2Q4YNDYRTx@xhacker>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 19 Jan 2022 11:24:16 +0100
Message-ID: <CAJ+HfNiS7Ss0FJowPUrrKvuC+1Kn9gXb=VqNoqh3eWJDu=m4Mg@mail.gmail.com>
Subject: Re: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
To: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 palmer@rivosinc.com, Daniel Borkmann <daniel@iogearbox.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, 
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Tong Tiangen <tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_022430_644463_F7E1E20C 
X-CRM114-Status: GOOD (  17.25  )
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

SmlzaGVuZy9QYWxtZXIsCgpPbiBNb24sIDEwIEphbiAyMDIyIGF0IDE4OjA1LCBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMTEsIDIwMjIg
YXQgMTI6NTI6MDhBTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+IGVCUEYncyBleGNl
cHRpb24gdGFibGVzIG5lZWRzIHRvIGJlIG1vZGlmaWVkIHRvIHJlbGF0aXZlIHN5bmNocm9ub3Vz
bHkuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdl
aS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5v
cmc+CgpOaWNlIGNhdGNoLCBhbmQgYXBvbG9naWVzIGZvciB0aGUgc2xvdyByZXNwb25zZS4KCkFj
a2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jCj4gPiBpbmRleCA2OWJhYjdlMjhmOTEuLjQ0Yzk3NTM1YmMxNSAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMKPiA+IEBAIC00OTgsNyArNDk4LDcgQEAgc3RhdGljIGludCBhZGRf
ZXhjZXB0aW9uX2hhbmRsZXIoY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLAo+ID4gICAgICAg
b2Zmc2V0ID0gcGMgLSAobG9uZykmZXgtPmluc247Cj4gPiAgICAgICBpZiAoV0FSTl9PTl9PTkNF
KG9mZnNldCA+PSAwIHx8IG9mZnNldCA8IElOVF9NSU4pKQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gLUVSQU5HRTsKPiA+IC0gICAgIGV4LT5pbnNuID0gcGM7Cj4gPiArICAgICBleC0+aW5zbiA9
IG9mZnNldDsKPgo+IEhpIFBhbG1lciwKPgo+IFRvbmcgcG9pbnRlZCBvdXQgdGhpcyBpc3N1ZSBi
dXQgdGhlcmUgd2FzIHNvbWV0aGluZyB3cm9uZyB3aXRoIG15IGVtYWlsCj4gZm9yd2FyZGluZyBh
ZGRyZXNzLCBzbyBJIGRpZG4ndCBnZXQgaGlzIHJlcGx5LiBUb2RheSwgSSBzZWFyY2hlZCBvbgo+
IGxvcmUua2VybmVsLm9yZyBqdXN0IGZvdW5kIGhpcyByZXBseSwgc29ycnkgZm9yIGluY29udmVu
aWVuY2UuCj4KCkFGQUlLLCBKaXNoZW5nJ3MgZXh0YWJsZSB3b3JrIGlzIHN0aWxsIGluIFBhbG1l
cidzIGZvci1uZXh0IHRyZWUuCgpEYW5pZWwvQWxleGVpOiBUaGlzIGVCUEYgbXVzdCBmb2xsb3cg
Y29tbWl0IDFmNzdlZDk0MjJjYiAoInJpc2N2Ogpzd2l0Y2ggdG8gcmVsYXRpdmUgZXh0YWJsZSBh
bmQgb3RoZXIgaW1wcm92ZW1lbnRzIiksIHdoaWNoIGlzIGluClBhbG1lcidzIHRyZWUuIEl0IGNh
bm5vdCBnbyB2aWEgYnBmLW5leHQuCgpQYWxtZXIsIHBsZWFzZSBwdWxsIHRoaXMgdG8geW91ciBm
b3ItbmV4dCB0cmVlLgoKClRoYW5rcywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
