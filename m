Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6113AC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 15:42:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF7B4610F7
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 15:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF7B4610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=isovalent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UCDehxSW8/SS517PgPlDOwD0MHUXEPGVLKfKeJKNWD4=; b=eUbYZSpyp1pl7oCffzWSVkS1c
	ksVF7YA4NsQcsddDfLRCc7QT4Wt5Y+U7bSAdpPW+vtuTvVz6lx9wiTiDsT9pAl+8r2P8f6/hT0y5B
	k9SJC/qCrg9ULUGZpZDqJm0arLePzExF70VX/rw8CKhTcz3gaL1L6swtWYlbf4BlWvoiKTe4sMdO1
	sh2DB2YII0HIdBdTo9l8ps15TuWzvJziDiaBcuAhrVuMRM5SrLa++mhGPgXHJNrr9z84EdTLY7aAS
	PGBzhCfCM1H+OfCWiD+l4S7i8o1exNQQerRTIqvrEejkAcZ6iD5sGvK1uS3PbjYgZ6XTEzCg+LcrL
	lm/EB8HPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX47e-00GeBx-Mp; Thu, 15 Apr 2021 15:41:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX47W-00GeB6-UV
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 15:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=; b=JQeXitI739kBSHyf6iRAxDZxVV
 OnZ6TjhhKNdvLhDxCSj1PCTaMai9Xf2wpy8kVdO0sKH4nVpmxaexFBQZ1nxO6vNOUN5lgCgi72owr
 HdL/gJ4qQkksRXixoDIJcpN80AUL9yEPOny4Ek2FwVUCY68wFDHWGICtb24bn6KhDERa9AHoFpvs2
 n3UL6DfGDsd7NEkOqP6mJTj06yTm5aaQhD85DfDfvv/b4YM6+mN3IqLw52IvobixkFNcLMy4ls620
 uWRVHzmZAujSxeqrWNlWvFr+AgxuKwkT4TRsKhaxzRXVcMTAaNDmnOsgXbnHa38PYfxDAHNeUhzX2
 rRbwc6hw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX47U-008iTY-C1
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 15:41:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id p6so17048320wrn.9
 for <linux-riscv@lists.infradead.org>; Thu, 15 Apr 2021 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=;
 b=BEj/1/8XPncnjRfRK8mLiZ1SoZ2+BwrE+a39LxPwB/MsIFJnzBAICQLZ2jiwGGbQov
 4zqh7un0jhEP1iNaKM1PurWOo4uOYi/n2gtxwCVm76y8egSWq0m6KnadRWC5DH8hi34C
 K41+UsN0jCiClEebcR9kPZsL0Lx6/VJV5Li9dNkP8mG/+bW6Uxqyyarpphfbe13+sVlb
 FizX/3RV1YXqCKanusixVoY8OxsNOXFXCWpfkOB2NeLmRvAHXodqwMYxxCYasGQZQftV
 OsBicx1g9iYrnNMRoDBiJ4p9GtlEji++P0zPJAhhkeDvxObWb1E6q5IO+XBq+ah9VkM2
 b8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=;
 b=cksOfE7hbNY43vgUpH7nbucDu60oD+LLX4ELK+aq85ck9IVhIGS34Y264zJepxP+Qh
 0g2Axlv5vRjWrOc6VSERUyPzsphxXGZFvNdIjtY5ad2JpGYEev6iEhD4XOBsfwJOgt2X
 mvvt0dd/lyQMGasWo8lsGCmLPjW+Fm3dIEAt2LqH9G3ijEOrY3/HCNQzpdyUNCiOOquA
 qvV+WJwiNIfQRikPoYGm59IVFuSg24WZsKTqp6D+RqDnpRUFt3F31jtsqGiN174HtbA2
 GUIK2HvHKin6Ujp+dJdsi73t48OpcgB4p1eH8XSbLEfc48nG/68+GXRf1o5EdUfTsmpX
 K7Uw==
X-Gm-Message-State: AOAM530t3WgyFuhzokh3ttggDqKiLH1xFFtcBh3Bftx4StLyXAnXnfBG
 pFWOD8K+KYwF+IBRswcbS+gPrQ==
X-Google-Smtp-Source: ABdhPJyLNMOWPYjLpplPAmINNkz2Fou+qVJXho8kWclmtHcejA/NRHvG9yzn7ifRTNHYBMXjICP1Nw==
X-Received: by 2002:a05:6000:ca:: with SMTP id
 q10mr4272021wrx.104.1618501286182; 
 Thu, 15 Apr 2021 08:41:26 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.87.196])
 by smtp.gmail.com with ESMTPSA id l14sm1920076wmq.4.2021.04.15.08.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:41:25 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Daniel Borkmann <daniel@iogearbox.net>, Jianlin Lv <Jianlin.Lv@arm.com>,
 bpf@vger.kernel.org
Cc: corbet@lwn.net, ast@kernel.org, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, davem@davemloft.net, kuba@kernel.org,
 illusionist.neo@gmail.com, linux@armlinux.org.uk, zlim.lnx@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, paulburton@kernel.org,
 tsbogend@alpha.franken.de, naveen.n.rao@linux.ibm.com,
 sandipan@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
 bjorn@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, iii@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, yoshfuji@linux-ipv6.org,
 dsahern@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, udknight@gmail.com,
 mchehab+huawei@kernel.org, dvyukov@google.com, maheshb@google.com,
 horms@verge.net.au, nicolas.dichtel@6wind.com, viro@zeniv.linux.org.uk,
 masahiroy@kernel.org, keescook@chromium.org, tklauser@distanz.ch,
 grantseltzer@gmail.com, irogers@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iecedge@gmail.com
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
From: Quentin Monnet <quentin@isovalent.com>
Message-ID: <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
Date: Thu, 15 Apr 2021 16:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_084128_527101_13B057B5 
X-CRM114-Status: GOOD (  11.02  )
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

2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 4/15/21 11:32 AM, Jianlin Lv wrote:
>> For debugging JITs, dumping the JITed image to kernel log is discouraged,
>> "bpftool prog dump jited" is much better way to examine JITed dumps.
>> This patch get rid of the code related to bpf_jit_enable=2 mode and
>> update the proc handler of bpf_jit_enable, also added auxiliary
>> information to explain how to use bpf_jit_disasm tool after this change.
>>
>> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>

Hello,

For what it's worth, I have already seen people dump the JIT image in
kernel logs in Qemu VMs running with just a busybox, not for kernel
development, but in a context where buiding/using bpftool was not
possible. Maybe not a common case, but still, removing the debugging
mode will make that impossible. Is there a particular incentive to
remove the feature?

Best regards,
Quentin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
