Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE2C61DB3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZIxfaJ7cpmwARX0iQIA9lom9paETn5l7LuiL0edNno=; b=hmqkAcVNdvK3Bk
	D2gtWtQd0/QgOgDDFTT0vscWMCKG/VzlLsSVPD2RITvZkW7DX9yp6nDFndbTQq6FudjlvBizA8WMR
	O5vrWPED8ffr/ZglAbozs7+rkPpkkF7jHLU8bhGL2EW+c5zax8/uVDdT5txxttq3qWvRTw51b6NE3
	YGx8FiDue5Zd4ViNdi/F3K6WzW6cLMkiMASLNkaQlxxVCJDeJ3nIj5FKNdFREd5GlyiTMNkb0a6gS
	wZhD8QN4DCfyK3hmKldveaTwStSHqeBLL4DC37NzcqsX4V2/7ISlnR2WEaEWveHpga5ZMJIJy+pyU
	JaNRm0Mhfzg0BapWsWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExOt-003V8C-2T; Mon, 09 Jan 2023 19:01:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExOm-003V4E-Ie
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 19:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673290891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
	b=TVfZqP1sM93wEmFIayUEh+PY8zjdK5irX+7Le2qgA33HbMFwjrGUUQGCXWLOg1U2MUVLVy
	UhkGJs9dO/PZ9yYILR48seBj+Q2Wn3OpT25rg9C7Gpr6Q+qHGJ1xnpvy3BGqFEw1douyWH
	5INe1UFybdOG59vITwt+fVv9jwDDPqc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-Vrkz8VgRO8Gj-T5G-CKxuw-1; Mon, 09 Jan 2023 14:01:28 -0500
X-MC-Unique: Vrkz8VgRO8Gj-T5G-CKxuw-1
Received: by mail-qt1-f198.google.com with SMTP id gd12-20020a05622a5c0c00b003ae18bc7847so924184qtb.5
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 11:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
        b=CBuR7o0tM0CQgu+INK+wsXqqA05+qgGxaWrPmenWDiGDQryUPOqDtYNFmVk/TYK9pk
         QdfU6c/1qpQaJaeezNn0aadvfhto9xGD5UiFBlKvSn9REMEdLEeXrDxG29uD9DjavLTY
         4g7d2hN5e1+dM5ykPzNIAFFRqoAUy2VUCOzuBJ+w1zTqOUipe+6xLpi4REcyUxxkgntQ
         L3yfQoaZIcMldrY8p6lw0ih7xiEXc8lopIF33j1uXTBFx7imvKV1eNCtAAfWimTjtlLM
         oFmOiPvRLRlvsWn1kqOjrqSCqUWoZzxLUwe4pXLkyfetydXdUOJaXWCW1pAYqs0BqZ9/
         Lkag==
X-Gm-Message-State: AFqh2koxYOM32VHy9IlNVlRlMHk3RxGJq/BkS2Ycf9Utb4jYSUg9b8lO
	aXP25idDqCzcFcJFIQJsaU/Dc2za1151y7BdRgfrUGKrNW6pAKydVOm9YJYm+7iCK+9TyPoWTd2
	bpKfXZ7cDoFUXwZ2gLwoOK/pU6xom
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336704qtp.7.1673290888068;
        Mon, 09 Jan 2023 11:01:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseRLv5+JCaBFPqzT7E7Yv2YOrloRSyhYUUSWRG6zA8srvH9gyrV5oV35teC9nwwkDxbanAYA==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336646qtp.7.1673290887764;
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id cj12-20020a05622a258c00b0039cc0fbdb61sm4985479qtb.53.2023.01.09.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, Guo Ren
 <guoren@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, "David
 S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 6/8] treewide: Trace IPIs sent via smp_send_reschedule()
In-Reply-To: <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-7-vschneid@redhat.com>
 <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
Date: Mon, 09 Jan 2023 19:01:22 +0000
Message-ID: <xhsmh5ydfedml.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_110132_764646_5447CE1D 
X-CRM114-Status: GOOD (  12.02  )
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

On 08/01/23 20:17, Huacai Chen wrote:
> Hi, Valentin,
>
> On Fri, Dec 2, 2022 at 11:59 PM Valentin Schneider <vschneid@redhat.com> wrote:
>> @@ -83,7 +83,7 @@ extern void show_ipi_list(struct seq_file *p, int prec);
>>   * it goes straight through and wastes no time serializing
>>   * anything. Worst case is that we lose a reschedule ...
>>   */
>> -static inline void smp_send_reschedule(int cpu)
>> +static inline void arch_smp_send_reschedule(int cpu)
>>  {
>>         loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>>  }
> This function has been moved to arch/loongarch/kernel/smp.c since 6.2.
>

Thanks! I'll make sure to rerun the coccinelle script for the next version.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
