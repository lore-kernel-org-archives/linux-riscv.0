Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E9C10F2862
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSTcmb2OMgtUswTXI4SLVXYDzpbRisPjludVHf/MCRQ=; b=mLjcZXwXk6iJav
	d5RQi2uIBKUMUD1+tt6d3Rf6TFN9EurEN1KgJ6SU+8UJpYHP4WnCumgLnHkVVRNy7Eg8iumBDouyW
	qWCzSE1oz1wPUO6MNpSWSe7KLoc2TGSlEolfiXzEeO8hL/2JTDv6cB7Vc/s4mAKdGw2J546wz+q1H
	7zkiLZdCVrLtbN04Shk+YzNoKCHzlDziiz4MQw0/cxaUKRsgtAn7YmrJTVnfqaN1Hm6KXldbA49HU
	5rcyco9+qvZwitdGqrtOzT30XKK4ZSvUVQiP7Wwih+Kc06cKRYycFzx1eoeILA9UDmF5lgaHAgJSW
	FMZLFRvwAVtUdGpY7q3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BFw-00000007sV7-2tXf;
	Fri, 27 Mar 2026 17:46:00 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BFu-00000007sU9-3yw4
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 17:46:00 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12a70b4de9bso156826c88.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 10:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633558; cv=none;
        d=google.com; s=arc-20240605;
        b=eXIyUTGV3zxW0dKycDbzfG5k6G/gwnm/BgZhc8C6QJ6eTj9wbJAmVuGonp+1bOGVJF
         7gOVAtyUuiqyrYo2NLTpIIrnuPwkguL4keIp9Ek586EWqOJ0vkIgsKMr/uLU/Mhut7R/
         1B6QGQfNKHknTyn+gynxF28Mjmz6xWGNPOuueoxo1QnrKFnoSaia8Uld4gyz+G2Ff0qb
         l4QVbLz1d4yBgH3hUNqhj/egh3kF/xlF5mrciV/+L77QEGkSa6lQSkjXXT/T0SVE5hwl
         Sz9n15s2LnrUeC9S89jcR0QMjnfe5Cc4ylp+Mj9Q7EINqTT59Y8+ZhgZJLrlhQmZRBhr
         fsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        fh=q3yfjxIN/V7GwJZtsXHw7mPYhbHT5C2Wm+aRn11NQcQ=;
        b=Th0LIxFdgiGgsUmvedNivyqFo6CA7IFO1I1w2r1goGCMBMLw3WNJqNlosR0r9QlFmG
         v9SFAUyRQCxt5eCywlhaxyHNnyhprbndbNH+SCIS0jUxyjyb/hJJMJtE1h//PFP9rbmw
         BOjpCrBPGilE8MQIIy6CVAncEoYYXss1P2Io/z1htvGdjhOP8/SbDo/EZ7DTTqQPanBs
         2yxdbLK1gItxsvMBFYdne0i4/V8XeYbnJx7+DSCSbpBUK16YkxlJgFwjdWkhUFyONPYC
         21DAXM+7ZyI7PjNIzlYk/x043kpJ8wCRmnNztRud3iT6JnPwN6NmNvMn/QdFKrhvbVVR
         MpgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633558; x=1775238358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        b=Fb/+rCXej/Fod1dO4bxjR+NdRql8yRLhu3/poov6ZdBdabRc0aQ1vRzz9f8iUj+ZNO
         vRz42uGp/Y8FL4WgwVpIFi5XOe8m6D0s1ctCFjNYcjntGjDh1j2wPtRU4ag9iResuUUZ
         okFmKIUG0CFoVk2/M5Z/7/oiMsPOqFe2TasYjhJw+grX/4/YjbaCk7KMepTpOKASlI6v
         YwqNsTVXAbfWijoOPyWkQ6dPikInylTXeH2qNQkUw2ugy9DNmHNFoJK4cPgYixXyXtHa
         8qZgnxflSJxByTK932anVq/mqPhyAdC61dfFzo3ERNJ9UT7wL4xQ2qeZt2cPk4GR6TGE
         pa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633558; x=1775238358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        b=s9RehiU7vk9PwllueG9inDNYUoilxbc9Yp9tjcp8yho0OEm6ArIy/w7YdHuYua/XR4
         JqsA4gYr5YSDQwmpWBnWAZUC/UlTpTYEEy0g7RzlBAmiwnO8Y5Au5TGwdp9AzykxualZ
         aF6PemZAr5ZX/ym8GUpnP3RaUYvWoPMpD5MnJUb1k67fUqsOrfpj0xp2nzUUr1crZIfb
         qkI7dVDcu4iic57sCxmRJ1GNlGMfN+pZAQqv2Ipnjfy8kJz1xgOl1vwy4BvigkNXXyJ4
         hnfrdxNT2kMDd38z+HhcCe8nZQUHGOMoB58fWd5wulqQW23IhIfP4OV4uCRAGLb33/sY
         mg3g==
X-Forwarded-Encrypted: i=1; AJvYcCV9b+mqVluFHE9SY9M/snaTmQwm2pRA+1EDpEpF1G9CpQPURSojfPW5mjGRyNoF/PRdncBp6UcVUz59tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZCDMaUj5ItCNhrcXBxyYVzxiRKjack4Ym108SY4tUM2i5z61N
	oRsjBYbN7tT/15FEcTrIVo66Ku9PSASAV9YGud/ixc/IlzXpyaQZH3ueqSbMgwR5Dc04fO9ill3
	+d+WDtR6PpnYdIqCTIexTgz+Og0+c0tg=
X-Gm-Gg: ATEYQzyIqXlYQYP4qvAejkri7rEsW5ufvcb68crp3R/WG4MUK5tBfr2/dqXjMZ3QMGo
	ukAxQrUX7hmecSCFyl22eU4i1Kqdyz35/OWexp6kt2iwrAdZNapsmEz3CYGYhA3mLEgkZorLI8E
	CYuVQ4XWrVf7+xu8twbfD/RgZYZJFiaexB7SpfGyJRAH9d8IenA4vPdfEhsioiwjuMEcz2ZclG3
	lejfithgaMKJOTOljz1fMiAbqxSDJHEVeR6SJW9I33lUAcyOi7cEI++wwD4etR3fUuGXgv/7twq
	JNnRJsOqLWdAXG5bWo4i15ishMG16WxRXzhHJk20mThCjnLeksQ0nqV+y4MgN1G7nIQAEFm7wmo
	pVa1LseHgCWut0xcu9Hg4YSo=
X-Received: by 2002:a05:7300:80ca:b0:2c0:d9be:eb09 with SMTP id
 5a478bee46e88-2c185a57557mr875171eec.0.1774633557661; Fri, 27 Mar 2026
 10:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <20260327114741.91500-3-pilgrimtao@gmail.com>
In-Reply-To: <20260327114741.91500-3-pilgrimtao@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:45:45 +0100
X-Gm-Features: AQROBzB5tJkP8M6dPCGpMeaOv63a95dhaN59p5xt7LwFdgRiK0mSmaXLq6iSY1Q
Message-ID: <CANiq72nFSyKSUcRJL-uME7QsvS-4aaNN2nVp44W49Q6VZhCJJQ@mail.gmail.com>
Subject: Re: [RFC 2/2] tools/ufq_iosched: add BPF example scheduler and build scaffolding
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: axboe@kernel.dk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_104558_986265_B1435699 
X-CRM114-Status: GOOD (  10.57  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMTI6NDjigK9QTSBDaGVuZ2thaXRhbyA8cGlsZ3JpbXRh
b0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gKzMuIHJ1c3QgPj0gMS43MC4wCj4gKwo+ICtSdXN0IHNj
aGVkdWxlcnMgdXNlcyBmZWF0dXJlcyBwcmVzZW50IGluIHRoZSBydXN0IHRvb2xjaGFpbiA+PSAx
LjcwLjAuIFlvdQo+ICtzaG91bGQgYmUgYWJsZSB0byB1c2UgdGhlIHN0YWJsZSBidWlsZCBmcm9t
IHJ1c3R1cCwgYnV0IGlmIHRoYXQgZG9lc24ndAo+ICt3b3JrLCB0cnkgdXNpbmcgdGhlIHJ1c3R1
cCBuaWdodGx5IGJ1aWxkLgoKWyBJIGhhdmUgbm8gY29udGV4dCBvbiB0aGlzIHBhdGNoIHNlcmll
cywgYnV0IHNpbmNlIHRoZSBmaWx0ZXIgQ2MgdGhlClJ1c3QgZm9yIExpbnV4IG1haWxpbmcgbGlz
dCBkdWUgdG8gdGhlIFJ1c3Qga2V5d29yZCAoSSBpbWFnaW5lKSwgSQpndWVzcyBJIHdpbGwgdGFr
ZSB0aGUgY2hhbmNlIHRvIGFzay4gXQoKSXMgdGhlcmUgYSByZWFzb24gdG8gaGF2ZSBhIGRpZmZl
cmVudCBtaW5pbXVtIHRoYW4gdGhlIFJ1c3QgZ2xvYmFsIG9uZT8KCkN1cnJlbnRseSBpdCBpcyBS
dXN0IDEuNzguMCwgYW5kIHNvb24gKHRoaXMgY3ljbGUpIHdpbGwgYmUgUnVzdAoxLjg1LjAsIHNv
IHRoYXQgc2hvdWxkIGJlIGZpbmUgZm9yIHlvdS4gVGhlIHBsYW4gaXMgdG8gZm9sbG93IERlYmlh
bgpTdGFibGUncyBSdXN0IHRvb2xjaGFpbi4KCkluIGFkZGl0aW9uLCB5b3UgbWVudGlvbiBuaWdo
dGx5IC0tIHdoeSBzb21lb25lIHdvdWxkIG5lZWQgbmlnaHRseT8KaS5lLiB5b3Ugb2ZmZXIgYSBS
dXN0IDEuNzAuMCBtaW5pbXVtLCB3aGljaCBpcyAzIHllYXJzIG9sZCwgYnV0IHRoZW4KcmlnaHQg
YWZ0ZXIgeW91IG1lbnRpb24gUnVzdCBuaWdodGx5LCB3aGljaCBpcyBlc3NlbnRpYWxseSAxIGRh
eSBvbGQuClNvIGl0IGlzIGEgaHVnZSBjb250cmFzdCwgbm90IHRvIG1lbnRpb24gdGhlIGF2YWls
YWJpbGl0eSBvZiB1bnN0YWJsZQpmZWF0dXJlcyBpbiBuaWdodGx5LiBEbyB5b3UgbWVhbiBzb21l
dGltZXMgeW91IG1heSBuZWVkIHVuc3RhYmxlCmZlYXR1cmVzPwoKVGhhbmtzIQoKQ2hlZXJzLApN
aWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
