Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45270CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCLjgXfk1dAGBpNdWQeY5TFfiHuvJzVIcvwm10LU51o=; b=a4y2pB4kAG1vEs
	sYoP8d13B46l1mmHqW4FPfE38uGfKUqZ/DGxGhKSAeZ/89CEimtmEu+cWHK79RUs1yaWYdk807fMc
	ha7l/nJiwQcAtSr775Ur6bxhumN2wCUpGy5NQlTY3+Ql2NKz1Rozs44vIqDPXQvNQrWtrEjfR92XV
	YWlZCXJnv5+v1T5pv/9CT81NMVEh60xIwjrapWgFj1YagoSHZalwtqs5VClJVaknypwfJyLcO2gKY
	c3V2kp5iWTBPWq6PGPbfcb0r5TMjAfIZnkbwuDemhcDCwobnu+i0Q4cr3oE/PzMO7CVDuoegqQzIg
	1PLAlY9SnV9/uhWNILWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAJw-00000000d8O-0syJ;
	Wed, 03 Apr 2024 23:47:08 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAJa-00000000d1v-0fOy
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:47:01 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-430bf84977dso2480151cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188005; x=1712792805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAEOu6ZAgToX5xrdWbP5fG/SmvptjBh1dUJnI3/9gK8=;
        b=rFKi04gIY3qE2qz+ZZoCApFJtkmoaV9yHcivuOnH4kGloVUuEP8ZmJ1wG0aR+KiX8k
         AjkRjvbeijP3NHswkzgbV4TG0OPck4Q4av2GTkzSOXx7AghRP04aCoywgBAMsx5Zjx2s
         rFMCRme1c8Eyid7e82Q9frMIFKVn7+pllKhoUAmgRozDKXio54ZBntQvsh0bWDLkY2OL
         MgFooP+C8k4UsgS24pxkcrHzuav9+Bh8l0AigNc6r1O8oWX6vRb2owheol5qi+WvSmaA
         NyTznWJtvReTWWZrCN+DyzV/f+NMmAAkbSGfrtrZ3MR3VER0qrf2SC1eDAakQVMhfG3o
         Izuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188005; x=1712792805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAEOu6ZAgToX5xrdWbP5fG/SmvptjBh1dUJnI3/9gK8=;
        b=XUSqii31Ve1C78DMGUE0VZMBk4hHn15nA3zLLfotMVuztO2KUDkN7zg3CSIXUdTCzR
         EYufyd+V2MHp7+zq+GO7f3ZWUFSO3TGLgCM5DM/A3nv8RMxFe1lQSxKhyApTrcM9fgX2
         7IrEbk4Ob9rvUZnEFD+aXHAeSf/pq1JauswtoWztP5QGWSlhT/gyQkfOH6nkOzMLMGt0
         x8Z/9U3ayXDOPCH+b8xz7G8TAi15e8ITpVkv1n3JlPHeSDsVSlTtywC1yB0xCYaXuhiC
         IKtzPK2jM+Aa6ZtF8Ys45D3H1MrKd5gDcIfTDGCbrfu//BpPsYw9KVn+qfaZnT+C9KaL
         33eA==
X-Forwarded-Encrypted: i=1; AJvYcCVoefkalwFq3HGKWf1hf8aIcMbWQ6Rs3aMYxQ71gkQ6shQ6IzQI4v4fMME9ISfinXOPsfsqWCvC267W4mB+ROGNMhFhfGZEGASt/5Y6cM5H
X-Gm-Message-State: AOJu0Yz2FNsAOJIAcNUfAFXlWLGu753Cmz3vDNRegHClixNX6WDTQiye
	vh47HLqyWgAG9MPDB2ZuLrpT4Tn8cjd3D9L3lSQnbOxnR+zNjgi+X/eKqxE5ES2jgcy+koQRn26
	peX6ymjIb5CLThk6x5xL6M8vibEEBTsTOj956cQ==
X-Google-Smtp-Source: AGHT+IE86C4cI6mhSlVjNrd7GYRP9iJnVqBNonZegmUQItEJKzhRVRBavtnMQfl/Dr8sTGYjRV3i2VRx333RRXokfYY=
X-Received: by 2002:ac8:5849:0:b0:431:6cc3:8bb6 with SMTP id
 h9-20020ac85849000000b004316cc38bb6mr854843qth.57.1712188004913; Wed, 03 Apr
 2024 16:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-7-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-7-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:46:07 -0400
Message-ID: <CA+CK2bBomXx-yfJCLsFLwduOu_Payg0y-t8D+nJYX4XEJ4bF0A@mail.gmail.com>
Subject: Re: [PATCH v12 06/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pte_clear()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164646_430103_C436B26B 
X-CRM114-Status: UNSURE (   7.95  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEx4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBhYTIzMjIwNGM0Njgg
KCJtbS9wYWdlX3RhYmxlX2NoZWNrOiByZW1vdmUgdW51c2VkCj4gcGFyYW1ldGVyIGluIFtfX11w
YWdlX3RhYmxlX2NoZWNrX3B0ZV9jbGVhciIpLgo+Cj4gUmVpbnN0YXRlIHByZXZpb3VzbHkgdW51
c2VkIHBhcmFtZXRlcnMgZm9yIHRoZSBwdXJwb3NlIG9mIHN1cHBvcnRpbmcKPiBwb3dlcnBjIHBs
YXRmb3JtcywgYXMgbWFueSBkbyBub3QgZW5jb2RlIHVzZXIva2VybmVsIG93bmVyc2hpcCBvZiB0
aGUKPiBwYWdlIGluIHRoZSBwdGUsIGJ1dCBpbnN0ZWFkIGluIHRoZSBhZGRyZXNzIG9mIHRoZSBh
Y2Nlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJt
LmNvbT4KClJldmlld2VkLWJ5OiBQYXNoYSBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVu
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
