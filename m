Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE88EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfuIraVvPJyarV0kJO5M7qaaGlAuolr1Q8sobyGSeyQ=; b=EEWmW4FUuLusIc
	/0q+RX+aUPEE9k09fUJNi+AhL4/TOtqIIOwXoCZhSzmYNSLMLlp17gvD+v/BsaWhH/nKevM7GthJX
	DWXkJffiMbjalo/0llpFJoDAVAJlUgOP3CtgTyU37/ZRXjh1JGlhxpqQCo0REM3ooIfasYC01VcXK
	sgOI+dDifr6rryifZtI2qmR88nkTS5rSxA+Cpapo7ZCPz+3EVOnFCPsHsHzEtbXovrWOE0AMmTdiJ
	VUAizX9xR/K3ZESgot2flYLrwb3i441eFo4e27zoIoYbhYWBDKcPmaL6ep+zvtA6JL/gvvKlWhR+4
	VnWhGHZQ6MUua86TSfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQrf-004WE2-35;
	Mon, 17 Jul 2023 16:14:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQrc-004WBz-01
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 16:14:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6F4C61158
	for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 16:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A381CC433AD
	for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689610457;
	bh=Sx44thNjRKhLP9P5+or0VlNLH7j5C5I07ogs5/16HhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T80r1gPbXjv1SoRVNtZ7HW9NItzws0okoDQBuQEbaeOo3VBY+9GQ8qWSpRT5mMLEk
	 n65oQS6Sm6H/4UxywXaocN/LNB8vaeNQ1CQ+8OUs5Ke/YL8gIbktTjKe/EVrHECAHy
	 3HMTD9R6rdXzMnbXPCJYHlUvp1oS+QjXru7blRzLu6e8e4XuDfmmBriUCxBOjsKCvq
	 S0m+k6ERQEPs+ftiZFthFTBhDUYvxAny+jbaFR3BtmgcvsL16VUvrYfVJPgWr5u6K3
	 MBt3Uxpms6QbZLAQpMP8RItQwnXZ9GG6sNAlxvjv3EWb8HQ32Pw6lDTNv9t9h5ls5U
	 OzJUm6TbHM7Lg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso7411020e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 09:14:17 -0700 (PDT)
X-Gm-Message-State: ABy/qLYCnrLAPsZ3LMUCV8HPsTSWDsh45pS6EVCg1NNaWAVztEsrOskJ
	4R84vuV5SA1t68YcAJKSAcjDIiuRUaVXr18wm7A=
X-Google-Smtp-Source: APBJJlGSRK/NccnTlgPIrL/sVQ3Gt+l6oXdva756uEn+PlB77r9xvayYmDWddY+owMdYJMgTGcAOq61mjkUYKNA4wIg=
X-Received: by 2002:a19:8c44:0:b0:4fb:8de9:ac13 with SMTP id
 i4-20020a198c44000000b004fb8de9ac13mr8170427lfj.23.1689610455595; Mon, 17 Jul
 2023 09:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230702025708.784106-1-guoren@kernel.org> <20230704164003.GB83892@hirez.programming.kicks-ass.net>
 <CAJF2gTTc0Gyo=K-0dCW6wu7q=Wq34hgTB69qJ7VSF_KAgKhavA@mail.gmail.com>
 <20230710080152.GA3028865@hirez.programming.kicks-ass.net>
 <CAJF2gTTt23iSDG_m4ihPhXhYDrz3Xnih=KGLx_ayBLbzPqaTaQ@mail.gmail.com> <20230717104508.GF4253@hirez.programming.kicks-ass.net>
In-Reply-To: <20230717104508.GF4253@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 18 Jul 2023 00:14:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQDVq0zedQ+55oX=gGSqb5OkDUoN1ipVu8RUQ5U_e=a9Q@mail.gmail.com>
Message-ID: <CAJF2gTQDVq0zedQ+55oX=gGSqb5OkDUoN1ipVu8RUQ5U_e=a9Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com, 
	bjorn@kernel.org, palmer@dabbelt.com, bjorn@rivosinc.com, 
	daniel.thompson@linaro.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_091420_159199_10B6BB49 
X-CRM114-Status: GOOD (  27.69  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNjo0NeKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAxNywgMjAyMyBhdCAwNzozMzoy
NUFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgNDow
MuKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IE9uIFN1biwgSnVsIDA5LCAyMDIzIGF0IDEwOjMwOjIyQU0gKzA4MDAsIEd1byBSZW4g
d3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBKdWwgNSwgMjAyMyBhdCAxMjo0MOKAr0FNIFBldGVyIFpp
amxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
T24gU2F0LCBKdWwgMDEsIDIwMjMgYXQgMTA6NTc6MDdQTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gPiA+ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJh
LmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlIGlycWVudHJ5X25taV9lbnRlci9leGl0
IHdvdWxkIGZvcmNlIHRoZSBjdXJyZW50IGNvbnRleHQgaW50byBpbl9pbnRlcnJ1cHQuCj4gPiA+
ID4gPiA+IFRoYXQgd291bGQgdHJpZ2dlciB0aGUga2VybmVsIHRvIGRlYWQgcGFuaWMsIGJ1dCB0
aGUga2RiIHN0aWxsIG5lZWRzICJlYnJlYWsiIHRvCj4gPiA+ID4gPiA+IGRlYnVnIHRoZSBrZXJu
ZWwuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE1vdmUgaXJxZW50cnlfbm1pX2VudGVyL2V4aXQg
dG8gZXhjZXB0aW9uX2VudGVyL2V4aXQgY291bGQgY29ycmVjdCBoYW5kbGVfYnJlYWsKPiA+ID4g
PiA+ID4gb2YgdGhlIGtlcm5lbCBzaWRlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgZG9lc24n
dCBleHBsYWluIG11Y2ggaWYgYW55dGhpbmcgOi8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ20gY29u
ZnVzZWQgKHByb2JhYmx5IGJlY2F1c2UgSSBkb24ndCBrbm93IFJJU0MtViB2ZXJ5IHdlbGwpLCB3
aGF0J3MKPiA+ID4gPiA+IEVCUkVBSyBhbmQgaG93IGRvZXMgaXQgaGFwcGVuPwo+ID4gPiA+IEVC
UkVBSyBpcyBqdXN0IGFuIGluc3RydWN0aW9uIG9mIHJpc2N2IHdoaWNoIHdvdWxkIHJpc2UgYnJl
YWtwb2ludCBleGNlcHRpb24uCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNw
ZWNpZmljYWxseSwgaWYgRUJSRUFLIGNhbiBoYXBwZW4gaW5zaWRlIGFuIGxvY2FsX2lycV9kaXNh
YmxlKCkgcmVnaW9uLAo+ID4gPiA+ID4gdGhlbiB0aGUgYmVsb3cgY2hhbmdlIGlzIGFjdGl2ZWx5
IHdyb25nLiBBbnkgZXhjZXB0aW9uL2ludGVycnVwdCB0aGF0Cj4gPiA+ID4gPiBjYW4gaGFwcGVu
IHdoaWxlIGxvY2FsX2lycV9kaXNhYmxlKCkgbXVzdCBiZSB0cmVhdGVkIGxpa2UgYW4gTk1JLgo+
ID4gPiA+IFdoZW4gdGhlIGVicmVhayBoYXBwZW5kIG91dCBvZiBsb2NhbF9pcnFfZGlzYWJsZSBy
ZWdpb24sIGJ1dAo+ID4gPiA+IF9fbm1pX2VudGVyIGZvcmNlcyBoYW5kbGVfYnJlYWsoKSBpbnRv
IGluX2ludGVydXB0KCkgc3RhdGUuIFNvIGhvdwo+ID4gPgo+ID4gPiBBbmQgd2h5IGlzIHRoYXQg
YSBwcm9ibGVtPyBJIHRoaW5rIEknbSBtaXNzaW5nIHNvbWV0aGluZyBmdW5kYW1lbnRhbAo+ID4g
PiBoZXJlLi4uCj4gPiBUaGUgaXJxZW50cnlfbm1pX2VudGVyKCkgd291bGQgZm9yY2UgdGhlIGN1
cnJlbnQgY29udGV4dCB0byBnZXQKPiA+IGluX2ludGVycnVwdD10cnVlLCBhbHRob3VnaCBlYnJl
YWsgaGFwcGVucyBpbiB0aGUgY29udGV4dCB3aGljaCBpcwo+ID4gaW5faW50ZXJydXB0PWZhbHNl
Lgo+ID4gQSBsb3Qgb2YgY2hlY2tpbmcgY29kZXMsIHN1Y2ggYXM6Cj4gPiAgICAgICAgIGlmIChp
bl9pbnRlcnJ1cHQoKSkKPiA+ICAgICAgICAgICAgICAgICBwYW5pYygiRmF0YWwgZXhjZXB0aW9u
IGluIGludGVycnVwdCIpOwo+Cj4gV2h5IHdvdWxkIHlvdSBkbyB0aGF0PyE/Cj4KPiBBcmUgeW91
J3JlIHRyeWluZyB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gYW4gZXhjZXB0aW9uIGFuZCBhbgo+
IGludGVycnVwdD8KPgo+IFlvdSAqY291bGQqIGhhdmUgZWJyZWFrIGluIGFuIGludGVycnVwdCwg
cmlnaHQ/IFNvIHdoeSBwYW5pYyB0aGUgbWFjaGluZQo+IGlmIHRoYXQgaGFwcGVucz8KCkRvIHlv
dSBtZWFuIHRoZSBiZWxvdyBwYXRjaD8gWWVzLCBpdCBjb3VsZCBmaXggdXAuCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
aW5kZXggZjkxMGRmY2NiZjVkLi45Mjg5OWRiNjY5NmIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtODUsOCAr
ODUsNiBAQCB2b2lkIGRpZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgY29uc3QgY2hhciAqc3RyKQog
ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRpZV9sb2NrLCBmbGFncyk7CiAgICAgICAg
b29wc19leGl0KCk7CgotICAgICAgIGlmIChpbl9pbnRlcnJ1cHQoKSkKLSAgICAgICAgICAgICAg
IHBhbmljKCJGYXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0Iik7CiAgICAgICAgaWYgKHBhbmlj
X29uX29vcHMpCiAgICAgICAgICAgICAgICBwYW5pYygiRmF0YWwgZXhjZXB0aW9uIik7CiAgICAg
ICAgaWYgKHJldCAhPSBOT1RJRllfU1RPUCkKZGlmZiAtLWdpdCBhL2tlcm5lbC9leGl0LmMgYi9r
ZXJuZWwvZXhpdC5jCmluZGV4IGVkYjUwYjRjOTk3Mi4uYTQ2YTFhZWY2NmNlIDEwMDY0NAotLS0g
YS9rZXJuZWwvZXhpdC5jCisrKyBiL2tlcm5lbC9leGl0LmMKQEAgLTk0MCw4ICs5NDAsNiBAQCB2
b2lkIF9fbm9yZXR1cm4gbWFrZV90YXNrX2RlYWQoaW50IHNpZ25yKQogICAgICAgIHN0cnVjdCB0
YXNrX3N0cnVjdCAqdHNrID0gY3VycmVudDsKICAgICAgICB1bnNpZ25lZCBpbnQgbGltaXQ7Cgot
ICAgICAgIGlmICh1bmxpa2VseShpbl9pbnRlcnJ1cHQoKSkpCi0gICAgICAgICAgICAgICBwYW5p
YygiQWllZSwga2lsbGluZyBpbnRlcnJ1cHQgaGFuZGxlciEiKTsKICAgICAgICBpZiAodW5saWtl
bHkoIXRzay0+cGlkKSkKICAgICAgICAgICAgICAgIHBhbmljKCJBdHRlbXB0ZWQgdG8ga2lsbCB0
aGUgaWRsZSB0YXNrISIpOwoKQnV0IGhvdyBkb2VzIHg4NiBkZWFsIHdpdGggaXQgd2l0aG91dCBr
ZXJuZWwvZXhpdC5jIG1vZGlmY2F0aW9uPwoKPgo+ID4gSXQgd291bGQgbWFrZSB0aGUga2VybmVs
IHBhbmljLCBidXQgd2UgZG9uJ3QgcGFuaWM7IHdlIHdhbnQgYmFjayB0byB0aGUgc2hlbGwuCj4g
PiBlZzoKPiA+IGVjaG8gQlVHID4gL3N5cy9rZXJuZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9ESVJF
Q1QKPgo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
