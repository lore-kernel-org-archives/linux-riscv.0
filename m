Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B2C83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5jAO3VYL4D1rnZstPgtJ37sFAot36//eSJ91dPFcxs=; b=BowIsfxMxqTu6/
	PWBZUelBhDmtJdKEYHZJ/Sh9GymLUsbsElKDCFcuZd9lwKLTeQ7z0rkpiSr9JdCnVh5RhXEOKf3sx
	YSAaLcrzMhBYwSOgQ19QLqwfKp+APVpk19kDIGM2ANU3WkZ03O5vS0Xehmnoot1PCm8H6UC08lTGL
	sSJL4DsNYxn1nekEe2QbiS2aI1WlaqF7sC8XWqhv+vAXLVt0mYUKs7KMQJhbZ8oF7mXOb7UJxlHIc
	l9jxUMOq9be/zOfzMC17DECfLsHQ4ZeoHvnOwZr9rFTs8rMKdrwfIbpo5oYfFt94n7kmETOEkTIlA
	ygu6rwiPtxjl2ngZxzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1By-00000007eOe-2Dti;
	Wed, 16 Jul 2025 12:24:58 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Bv-00000007eO0-3ziC
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 12:24:57 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-876231b81d5so408955439f.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752668695; x=1753273495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ufN3hObMca4GLsjT1dwHltCBaXf3kFOYG4s7v4Jw4M=;
        b=KRDL265QwD83HkfMZc+8besRaw+17u2wzU93rNIR2+aU63DT5YgZZ6tPW9kJ5cJBxj
         cbqNeD8aQBCFxh+mtkTahXeU5sQlr6Jx1FftWeqisAlDAk/ZJRSFc+KCb72ISotkfuo8
         HpMGkPqy922e0ICHAJFnWsKBxr0hRbKa92HmPDctfnonxh6Zp4EAZQFbxNh+qE63jyF6
         j7eVjI/+R41Sfoqpl3fO4BvdnHRmtwCfC6eYgwWgF33FseWXr1Q1BdtRhcJnTzxbf79+
         scb+MU6d21CdTXTzUg5zOiQi1NsxaSC8vebAhILzPpOWO7mqxiOOpxJeNDGI5wyKBOmr
         c14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752668695; x=1753273495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ufN3hObMca4GLsjT1dwHltCBaXf3kFOYG4s7v4Jw4M=;
        b=G8EdQk/BHxpfaSEd67szcsSKRasLDwTOVXa1SYF3U2VRPqlLOdP00myO8F+1wfsee3
         MVwotQrk5NdhuhTfSU4ICvHiferpk9diQc+SVL5jP9+DbJuZ8ku/ya1hVvdsKEu0RTg1
         1KLZRrcQO0ruk4r/SOsPmcmp5/DDNcowZZH3Zg3BTSaUHWycB1Rf4A3D7yqdb3rT0tj4
         /E/JZ5VumN8iYe/DVonGkg0xZ4TTY0j6usluyLlobUUzzV6UXA8Reqe6qQj8TT/msswJ
         mTAFALupp9PT0EbOJbJPQT+QjsnvsOqMkjf5fDu6Gj9qcn/fo1+Jcg9ASt6Xhi7IXCwS
         yq0w==
X-Forwarded-Encrypted: i=1; AJvYcCU7G/ur3R/l9qdF2MUeEHXCvw0mkfwIdyctZ2NwiWl+uda0lE34pVKj44IoYyP+kD/T1ltcFFZs3PgPSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVv6aAda3aF/XakEbJEswTSTaR9k68i/z1bdmP414RHsu1TVIl
	ZhZRlLFQgcLJeu00eBy9O78Ok5fb4T+A+xwQb/aikZkzMyYcoKeB/PpV5hN0UGyuAI4yYAhiwmR
	LUq6QjHz3jIMjixXlsWqXFmGtQIZQuoTjFPPc6xLA9A==
X-Gm-Gg: ASbGncu6ofiDjD16Lat27OR/vR7y3/czEXeLml/g5mDZMXgOzXmVpMHri0rLPsrjD3C
	P8VZDQ7h02zXB+rZ0GkFyUkuKMN7eBJetxCTn9Nf29ARgabjaVVSTFByikPUdYUig/hnu0TWg7h
	e4o5znUfMOu89+3N+4Ceg1MG+SXTK6kBZuFajqLOAH8rJajQC6Cg/UFlnLSAiKQSbAS+R9iYz/x
	3gLyfE=
X-Google-Smtp-Source: AGHT+IHcBKm14IqMY2zZCku6eJ3aL9uOlgyeZlrEeJEsEb6pBAtDYAiLwB4M4psg96+hNqoIYo09iBakwOdp9w74hpw=
X-Received: by 2002:a05:6602:154d:b0:879:572e:238c with SMTP id
 ca18e2360f4ac-879c091cc40mr370204539f.9.1752668695035; Wed, 16 Jul 2025
 05:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250111004702.2813013-1-samuel.holland@sifive.com>
In-Reply-To: <20250111004702.2813013-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Jul 2025 17:54:43 +0530
X-Gm-Features: Ac12FXw5fRuKRk9Gh9hKxwhWqS2DR3ZACynLX0_VX_3TVKCKPIkjC2p2q_9ELUM
Message-ID: <CAAhSdy2x+bskK2Du-ys7TCeih=QEFRkkydg2VYGZniEt3zW3=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] RISC-V: KVM: Pointer Masking Support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_052456_224081_0DE9618E 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBKYW4gMTEsIDIwMjUgYXQgNjoxN+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBm
b3IgcG9pbnRlciBtYXNraW5nIGluIFZTLW1vZGUgaW5zaWRlIEtWTQo+IGd1ZXN0cyB1c2luZyB0
aGUgU0JJIEZXRlQgZXh0ZW5zaW9uLiBUaGlzIHNlcmllcyBhcHBsaWVzIG9uIHRvcCBvZgo+IENs
w6ltZW50J3MgInJpc2N2OiBhZGQgU0JJIEZXRlQgbWlzYWxpZ25lZCBleGNlcHRpb24gZGVsZWdh
dGlvbiBzdXBwb3J0Igo+IHNlcmllc1sxXSwgd2hpY2ggYWRkcyB0aGUgbmVjZXNzYXJ5IGluZnJh
c3RydWN0dXJlLgo+Cj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDI1MDEwNjE1NDg0Ny4xMTAwMzQ0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KPgo+Cj4gU2FtdWVs
IEhvbGxhbmQgKDIpOgo+ICAgUklTQy1WOiBLVk06IEZpeCBpbmNsdXNpb24gb2YgU21ucG0gaW4g
dGhlIGd1ZXN0IElTQSBiaXRtYXAKPiAgIFJJU0MtVjogS1ZNOiBBZGQgc3VwcG9ydCBmb3IgU0JJ
X0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOCgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWJhc2VkIGFuZCBxdWV1ZWQgaXQgZm9yIExpbnV4
LTYuMTcKClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
