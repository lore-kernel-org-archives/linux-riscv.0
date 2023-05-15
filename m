Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C7C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS8g2lNxATcHPCTtXWEv06pPhtsS0VkoXfXN35fYk5I=; b=2TYaH8X1qKDGap
	LOdKUjqeKmBP1eAQgbhQ8TjfrrVvOv5brkh5aNkktYdvjsiSp0ReZ7WCH85FCY6gHAIZWOXErjuoY
	2vBC2m0SJKcl2GgjG4x02iBQFG8mCiIsX2OboZWFGOkKU4nRYFQTnMFVsW6TJt/UYOdNl4rDJdFoF
	DdBT9nksdx2ddlsWl9R+JQYbAhTXYU3Al2SnRjnS+vSKVfea4AiM/UsqkeyD2pj90DxwOmRJttcbh
	hMx9FSVY/S2HYQPiwG2hnRgaVQgyChFr8iYbUoNMyg/6lLyCfhKlQ60Z5ROXZEGM52aArpaDJgqWS
	/dv2zUMbEdv8G4J5Jktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRdU-00185E-2u;
	Mon, 15 May 2023 06:24:44 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRdR-001834-2N;
	Mon, 15 May 2023 06:24:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-52867360efcso8680163a12.2;
        Sun, 14 May 2023 23:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684131880; x=1686723880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipVfxboz2N3BTbhUZctFrasYMvC8E8GR8fiHDB5wG9A=;
        b=K/Ds5UQDShQ1jfqjq8VIbQzq9KL8b4ueLhmM+jbfvGykQOm9udF30CIzh7yLh0AyyW
         VYx2xlivf2OSEdspjfb8Gx7JMtCBsJInxMc/fFczq4kfjpAo0USZOFUZc6QxtZNJ4j3N
         E79DBz4t+N8DzEbdPJRBFSlFxD+9mq6SDrSMmmWHAeKYSgfnh2tpWRcuuT+67GCsSXQ/
         FP3HV5EZfoM11bfhNw1pyATMs6J2zLTpG+S2im1DBjb52UWpC5TQMtLjdJSk97kejt+d
         ZrAzPOBGlVVTLZU9eegXT+l0o/7mv0ugLJBck6gy/AjW0mGGRfvrYJoYuhwH2BEWATXt
         pymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131880; x=1686723880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipVfxboz2N3BTbhUZctFrasYMvC8E8GR8fiHDB5wG9A=;
        b=Zdz1yzwvt8jG7Hn+crgmbXh43bFItFreDqJ13TcgbQqM/aGAwgRWBZ9hhPDJnw6fEI
         KUKc+anXKSR+gZqvOVg1Fl6c5u3gxzvIwe5RIiF7NdqBARHjJxYFab40oqe7bnxQ5Hs7
         fekQBU5OkYB4g/tuSVKP9bRw7p3kJ8kVLGpyPmBSAK0qVE6Lr4cWxIul23GcrXua4zia
         fYwv8IY/X9L4RUnuSWoKxDC5cr+2bfrW90/W9W6FV43jlRcYgbtOPnmONPDJfHwKQsgt
         NuaSOlfiU5eCrttjJ+4RsOh/fvzZ3KlwaKxb4ORZfDWRjBZVXzsAdWqgew4PYEOqPlk/
         XK2A==
X-Gm-Message-State: AC+VfDzlchkxgP4kkardzbrak+l6+vAQDJbHRv+J3KFRI2hUJrHcxJgY
	faC5gy5qbsuLlleaPXIkMRj0Bc1DVContjvO1qts9J7Vd68=
X-Google-Smtp-Source: ACHHUZ4wRiCLeYPgQOiKNNvZY75L/XiRY4hGc1xrqkwiizwTTiO+743uCn+9bRYh7GxEKf2LBVi2VCi/iVrz18zFAOQ=
X-Received: by 2002:a17:90a:d48d:b0:252:a7b5:723f with SMTP id
 s13-20020a17090ad48d00b00252a7b5723fmr11803679pju.2.1684131879992; Sun, 14
 May 2023 23:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683791148.git.haibo1.xu@intel.com> <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
 <20230511-boozy-comic-5bc8f297dc8e@spud> <20230511-leverage-backspin-34bcde885006@spud>
In-Reply-To: <20230511-leverage-backspin-34bcde885006@spud>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 15 May 2023 14:24:28 +0800
Message-ID: <CAJve8okYNEbk2PwXVzx+dMSq+uci=W_tpShNv3FER=pWRUymWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
To: Conor Dooley <conor@kernel.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_232441_773922_A0344BA3 
X-CRM114-Status: GOOD (  15.97  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgNjo0OOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAxMToyNTo0MVBNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAwNToy
Mjo0OFBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+ID4gS1ZNX0dFVF9SRUdfTElTVCBBUEkg
d2lsbCByZXR1cm4gYWxsIHJlZ2lzdGVycyB0aGF0IGFyZSBhdmFpbGFibGUgdG8KPiA+ID4gS1ZN
X0dFVC9TRVRfT05FX1JFRyBBUElzLiBJdCdzIHZlcnkgdXNlZnVsIHRvIGlkZW50aWZ5IHNvbWUg
cGxhdGZvcm0KPiA+ID4gcmVncmVzc2lvbiBpc3N1ZSBkdXJpbmcgVk0gbWlncmF0aW9uLgo+ID4g
Pgo+ID4gPiBTaW5jZSB0aGlzIEFQSSB3YXMgYWxyZWFkeSBzdXBwb3J0ZWQgb24gYXJtNjQsIGl0
J2QgYmUgc3RyYWlnaHRmb3J3YXJkCj4gPiA+IHRvIGVuYWJsZSBpdCBvbiByaXNjdiB3aXRoIHNp
bWlsYXIgY29kZSBzdHJ1Y3R1cmUuCj4gPgo+ID4gQXBwbGllZCBvbiB0b3Agb2YgdjYuNC1yYzEg
dGhpcyBicmVha3MgdGhlIGJ1aWxkIDovCj4KPiBJIGxpZWQsIEkgZm9yZ290IFc9MSBpcyBlbmFi
bGVkIGZvciB0aGUgYWxsbW9kY29uZmlnIGJ1aWxkcyBpbiB0aGUKPiBwYXRjaHdvcmsgYXV0b21h
dGlvbi4KPiBUaGUgd2FybmluZ3MgYXJlIHRyaXZpYWwgdG8gZml4LCBzbyB5b3Ugc2hvdWxkIGZp
eCB0aGVtIGFueXdheSEKPgoKc3VyZSwgSSB3aWxsIGZpeCB0aGVtIGluIHRoZSBuZXh0IHZlcnNp
b24uCgpUaGFua3MsCkhhaWJvCgo+ID4gd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAndmNwdScgbm90IGRlc2NyaWJlZCBpbiAna3ZtX3Jpc2N2X3ZjcHVfbnVtX3JlZ3MnCj4g
PiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd1aW5kaWNlcycgbm90IGRl
c2NyaWJlZCBpbiAna3ZtX3Jpc2N2X3ZjcHVfY29weV9yZWdfaW5kaWNlcycKPiA+IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZjcHUnIG5vdCBkZXNjcmliZWQgaW4gJ2t2
bV9yaXNjdl92Y3B1X2NvcHlfcmVnX2luZGljZXMnCj4gPgo+ID4gWW91IGhhdmUgYSBidW5jaCBv
ZiBrZXJuZWxkb2MgY29tbWVudHMgKHRoZSBvbmVzIHdpdGggLyoqKSB0aGF0IGFyZSBub3QKPiA+
IHZhbGlkIGtlcm5lbGRvYy4gQXBwYXJlbnRseSBhbGxtb2Rjb25maWcgY2F0Y2hlcyB0aGF0IQo+
ID4KPiA+IENoZWVycywKPiA+IENvbm9yLgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
