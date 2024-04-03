Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B635ECD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFsg02b3Ayyp8jsRyIbr3yOHCf26UhAAwQG+wS3Zgi4=; b=hukHQO4fJpO2St
	hkz5+hO/UxeLPD50o7SLNZoh9D/EpBd8Xn/sCZjRTBg+ShJt04i+wTlpMAhMajR5nmNTs32V5x4Xx
	4dV9Wz2QzqEv0FJztV2YykEaqWfUqZhc+c2bcEGK6ImFFqHnME70Ie2bPlCs3cyRF97ISGQ6MLulC
	oVXrdy/TX5VgEcj8tlqi5ZqUY+yo4pWzfqzJE17tVKi0gt9+qB1SGLyhIgM2wPPLVMuZPLOSicBRx
	bRiW/PiJljbThWx1S/bvXUYYyitCb2Lu3WoLjhPvwAdc/JU5sgMnFd2nCiZVX7f2igbXfX0zdOmHv
	ZOtcgBJSdb24X+G5Mf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9tW-00000000VaS-0Xqs;
	Wed, 03 Apr 2024 23:19:50 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9tS-00000000VYb-1WMv
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:19:47 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-430b7b22b17so2129151cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186384; x=1712791184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBincRL+yBjuZ8bs7hBLRbKTeES+FzXLwipS6By/VzQ=;
        b=RZ8lwcbwOb/IPuCM8mIbqsoQ2cNRI40L6b4JPZUA6eklSzLmRh/bvHUA1kyMqpJhoA
         iMm1PCGcOKOUQ+9q64X/puItPgpyMMf1iG7gNl9MCBH1iBfm6oXxcHR3KIqP/BUIPnM2
         ww0BuScinU3bZVuHUh8iuDCZOZcW6IZdu3SKxuzMVkjZIR8Ib9xxiKIKx4L5Y28MbDHF
         geuLLlHWEUSYffG9JfCuPAACDYC0awmqT0awfICFBZAcm2hDhjS9XC5l8JdHxvTY6rt0
         dX5Da8TApiXoWhRNg4Cafl204BnwhX1q9JFzU8y/Vxf6NiKajY5iWdVZtHvczgFJBWeb
         Pm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186384; x=1712791184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBincRL+yBjuZ8bs7hBLRbKTeES+FzXLwipS6By/VzQ=;
        b=fxr03uHYQsnq0G0YOIz4QcNcqvTXw9VXQKamtQBDSl6+L/rTWuJzmVVJc8zG0rzxd4
         PYp/Oynr9ywQHn9D2aH2Z5A8bNj306cHWh4FiYiRKCsKfMLsGPTrRsoxAhHsbO5+BQ1J
         WmQUY08fr+JhUPtdlKcArBgvAvxvEbEWVm4FgFymGtIvt20/WX4UDPFy6W4WPvuzcOMz
         zufM8/C5OTmkg8AaiP/YHAAAwCTfvV/zpYKKpJd6NC5+FYk5EEByB+XyFP5LpxFYq3fC
         wFNCMjAA6nZcPSnTVj0hIacLQoEse8K9dvWTaa6K4wkrvNzBHP0VSLIB5Mx/LrR8JOia
         jxkw==
X-Forwarded-Encrypted: i=1; AJvYcCW53JiHM1hMVHKZmXi4RqKdWE5UzLR40yKq8xIFA9xB+UtxCb2eH2Or+T0yyJbsGhUUvIw81MiehAL0WKsmKkx1OkU8xCs2R+p176Egad1u
X-Gm-Message-State: AOJu0YxZN0uKPb+bE9MbqUUYPlX6M4ZMBKkzGDUMz/0oJ4GRwPp8v5jD
	Kg6f3HYkDkohQnxzmlwWYqllKRcUwgq6eYAWL7bGd6AI+E6xVfbZeGaPP8vrCUxhIqG2atXzvbc
	tQispNDKHxCwxZ/tgWyurswtXrLCoWpJ/phnl2g==
X-Google-Smtp-Source: AGHT+IFqbzPGn9Pu00z+HmxSASTM3Pea6ZXOR4iwFZSFit+QP6eYK+U42m4BcRtJeMVDlEj7FerLpz/8MBHhfOSw1+A=
X-Received: by 2002:ac8:578e:0:b0:431:82ce:ed95 with SMTP id
 v14-20020ac8578e000000b0043182ceed95mr843988qta.16.1712186384061; Wed, 03 Apr
 2024 16:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-3-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-3-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:19:07 -0400
Message-ID: <CA+CK2bCajFVUY4jKLF8W7ezeUw6sZS9FJ0LrF7X8m=cA7Bbo3Q@mail.gmail.com>
Subject: Re: [PATCH v12 02/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd_set()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_161946_537948_92B848F7 
X-CRM114-Status: GOOD (  10.88  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEz4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBhM2I4MzcxMzBiNTgg
KCJtbS9wYWdlX3RhYmxlX2NoZWNrOiByZW1vdmUgdW51c2VkCj4gcGFyYW1ldGVyIGluIFtfX11w
YWdlX3RhYmxlX2NoZWNrX3BtZF9zZXQiKS4KPgo+IFJlaW5zdGF0ZSBwcmV2aW91c2x5IHVudXNl
ZCBwYXJhbWV0ZXJzIGZvciB0aGUgcHVycG9zZSBvZiBzdXBwb3J0aW5nCj4gcG93ZXJwYyBwbGF0
Zm9ybXMsIGFzIG1hbnkgZG8gbm90IGVuY29kZSB1c2VyL2tlcm5lbCBvd25lcnNoaXAgb2YgdGhl
Cj4gcGFnZSBpbiB0aGUgcHRlLCBidXQgaW5zdGVhZCBpbiB0aGUgYWRkcmVzcyBvZiB0aGUgYWNj
ZXNzLgo+Cj4gcmlzY3Y6IFJlc3BlY3QgY2hhbmdlIHRvIGRlbGV0ZSBtbSwgYWRkciBwYXJhbWV0
ZXJzIGZyb20gX19zZXRfcHRlX2F0KCkKPgo+IFRoaXMgY29tbWl0IGFsc28gY2hhbmdlZCBjYWxs
cyB0byBfX3NldF9wdGVfYXQoKSB0byB1c2UgZmV3ZXIgcGFyYW1ldGVycwo+IG9uIHJpc2N2LiBL
ZWVwIHRoYXQgY2hhbmdlIHJhdGhlciB0aGFuIHJldmVydGluZyBpdCwgYXMgdGhlIHNpZ25hdHVy
ZSBvZgo+IF9fc2V0X3B0ZV9hdCgpIGlzIGNoYW5nZWQgaW4gYSBkaWZmZXJlbnQgY29tbWl0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+CgpS
ZXZpZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
