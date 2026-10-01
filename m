Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5D4CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4H97Fe98fib5Czb9daCJ25AUVDv6JxDtnqtt+FqQVk=; b=C+H+nS576PR4Ri
	NRj3jccL6qvYUC/3uC1leUe8usUOGhBv5GO8lYP+E7ky3I51cC1YSFvNGFbvX9K/f/agLTJz7wSOi
	XJNwPsnGE9BiAGt2vMnDlW8f31d95upYvt8qDuRVo2NyvVGAB8+Cidg+APLJhWX1b8Wbfq6522l4F
	gp2AiqKc/7fI6uAdKpDJeMK9Hhe2h0f8xC+oJA5/FtksOZTRCl4iZkaImRHKKDNyiKibcF1TCYlJ3
	ZrTw9oKEaOLTm549I30KJDVVUGKRx4xit7Hkw9HO8eHATJjcQgpANEzBTYqJbE/Q/MB02cadfGS3n
	YySNIJKM8ZdwpscdvXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA44-00000007s8A-3ODX;
	Thu, 01 Oct 2026 06:14:44 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA42-00000007s7g-3wNt
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 06:14:44 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-52fb766bfd3so53582321cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 23:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790835281; cv=none;
        d=google.com; s=arc-20260327;
        b=aGDHMPUfUqJDGe5VAf+5Yl+6Kvki/H2ndQXecTIMjTz42ZfnSrzLD3q0mrfqfc4Amg
         bgmHHxnrFQZAq1gpY2Ec9r+xqJW/s+9I35bb4zV5w9b88SIoaqJqCtVI3DAUv2N9S55M
         hPoh+kcg89867QYdXTdMjOXpyXp2kjohkHfM+z69eA8cCkjSl7EBiOs3T1nYT0+m2DlX
         kp6pV/utZeDadnCW4PelsFY2JBrPnP5nvx9gUxhVzNyzmFSsVqZNWE54xQA2TaUPkSgC
         icCai0H4nf2ETbqt4gJfN6X2GxqWapY3un3h0kLxdIaEMNR6Ue8KWDMURKGFxzozKPvv
         pdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
        fh=6T0/0Jy0xhAbKJwyX04l7PEpOp4cea9xJeRgKkKfpKA=;
        b=LHy6pGDWwiA0Rmqh0IMGG3VYxYpNJv2Pi+cRiR11EjFcC+AouxSLyjPxhawwbBUnG7
         pz/qsGTVkaBcE8zrnM/a4ilQILlBg9WAaJCWEk7fcEF3rf/f6FZh0iY7ovVGc43/1kT3
         pgReB/9JRcnGV/qH94bhPBs7tXfCw84AxA0TnFP10hBRSYnz1EKG2bA+uC6nKd+3WRip
         0PVL9BTl2WlIA18+hF3w3BV4i6DpHtXPBUPFxJfBQ+dFSuZPzCYs+xb1gRi6Q4x6pCnZ
         PN08fO8vwQdr5GtVvINgu8cDHlaZuKoczhJM1pyjORXILbQGZyp4Ny2TRNkxiYbvAf9M
         RTrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790835281; x=1791440081; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
        b=qwwfmTmPYFfOnmmpPbHu3gK4ijGxc/yW4czKqpQca9gDQ0+iPdgri1hGwrm2L6zo+U
         GpFS0gegkxcoNUXoZ5jcsVIVZvLfR/ZPXFBugzsTnOepZ8nDD7qG7Rggdkllbf1Xg+Fw
         L2SiFkITf6hbHkFUc7RZIAq/PCYC79HH0c06U2k9isew7EPQ6SZBCKTwseUxdOX0/UIR
         GgvdlvACTwkpQARpxwL4FZ7hSYq0yHsdH3TdOF2Ce6xE+0PNtPGFQbgJ/QQ7WlpMcR9U
         GqWlXd5oJzjw/oAXb8muqehgtbqGy/nAo6gnU/COW1gx1aWy4MlE79tBrQ2igh4LxKGJ
         kHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835281; x=1791440081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
        b=jINsZk1qmIviwxVSqAzFnPoluKP8MzfAIAxfWSLkOHRcEtgV+LT/n2Z+1ErxPsze5/
         fQWSis1VmYjorZlP4qa1HJXjownBvaKqC3ZaYVHOddl3Y98Mhq9qwJWyGKArCFBU/7ph
         V1XNzS4V6OyGVzMrQTbUfzeilV/TsrV9muRCOpbt7i5AMUB7/1I/A3HjLkHVn+T5gO3F
         DBGQ4+QvisX4nMZjqhq+CCiSaVGWw5K/rDesnBLNLo+rFJFrTMtd6FMS/ocSQFEhVLX9
         Kts4uWjtpBRPv67qvGSW8jG/Stba16UesDvc5b7uGkoUcfq5/r0ELNXrCaaNuhCBTKXM
         UBDw==
X-Forwarded-Encrypted: i=1; AKwUvBzGC1Q8e8zTTjycj80YmWQJfGEB3qW0JDuXneqGJd4vCJoZP3t+pX9F8hG1pGbHUce9sHUHfUrdP8fefw==@lists.infradead.org
X-Gm-Message-State: AFuF++kPVD2QJdivEAfntTzRE2pozp3/I1xrQwLp92iLe28CL8rt2TBY
	QALHYWW/QUhWXh8x+4FUBo6RkFHuIPqPTegf0Ha4Fpy/zBBWBgpOvffqPJR+tEas/Od769Krscv
	729B3zLiBHr47ceCexY/n4Yc1iWcLtxk=
X-Gm-Gg: AYBFou24D1zFw6vFISFVUg+Tpl7wsGp7SybA0CjSDu4fHQRTxlgjR1i8+mOBThent/O
	DttG4Z2YGIRafRs1N7+yIhXcU1WEZeB9WUo/gQuvbfPHytA0ZZDzu8bkuhtmygwukjzy2Fs6IQ6
	0FmVTst9nO8SnNW/l3lL71RIGPLTPR02c2LXGKj7raU0ALldGnpnM/DQ3KHGfXJAGHEI/54KWku
	fdPxdqNHZ0OQWJwnObi4cmwTgtsfNtVBGKqjR93w4iA1Q5QAB/ziq4p7CsT+OMpT1hlIRQQNdPg
	ZTK0ReFJPcSsb47wOSwnWmfHSikBxq0X4aAJE5rENpb8RB2PMgEhb+o0
X-Received: by 2002:a05:622a:1102:b0:530:d429:c70a with SMTP id
 d75a77b69052e-53374a9f0e5mr71073341cf.26.1790835280875; Wed, 30 Sep 2026
 23:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260914115607.350097-1-imbigking12@gmail.com>
 <c28917c2-4715-4c70-a2d3-582ca641e1d6@huawei.com> <CAADnVQLGWcdi+G-cWkxLCtY-Q3iQ4TJKPcL4i35+c2e_snSUWg@mail.gmail.com>
In-Reply-To: <CAADnVQLGWcdi+G-cWkxLCtY-Q3iQ4TJKPcL4i35+c2e_snSUWg@mail.gmail.com>
From: =?UTF-8?B?Um9nZXLmtKrlgYnmjbc=?= <imbigking12@gmail.com>
Date: Thu, 1 Oct 2026 14:14:29 +0800
X-Gm-Features: AclHuK9sgnNLOPWv1o9b11spZv6pvIUx-GPm4pSYUHjOL1ryJGDiBjLKXIrglqc
Message-ID: <CAN2uUdme+EnpG0w2vD=kxWzDxb3ik9PDwZmV_Na-sVCC-HVOCg@mail.gmail.com>
Subject: Re: [PATCH] riscv: patch: fix handling of bpf-jit execmem addresses
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, Xiaofeng Yuan <xiaofengmian@163.com>, 
	Klara Modin <klara@kasm.eu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_231443_007781_451D4270 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 25, 2026 at 5:48 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Not clear what tree this patch suppose to go to.
> If it's bpf-next then pls respin with correct subj,

It's not bpf-next -- this is a riscv patch for the riscv tree, based on
riscv/fixes (b94cec5761d2). It only touches arch/riscv/kernel/patch.c,
and the "riscv: patch:" prefix matches both the file name and the
previous fix to the same function, commit 8718e5a3090b ("riscv: patch:
skip fixmap mapping when kernel text is already writable").

bpf@vger.kernel.org is Cc'd because the breakage manifests in the BPF
JIT -- bpf_arch_text_copy() fails and no program is ever JITed -- not
because it should go through a BPF tree. Sorry for the noise in the BPF
queue.

If a respin is wanted for any other reason, I'll carry Pu Lehui's tags.

Thanks,
Wei-Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
