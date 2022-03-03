Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670EDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sbfP06XKE3LT1q0DMOcj9cao7HAjecL81S/GjzdCBnQ=; b=H/Aml+k8d8nkUnJEvf34MEiXy2
	yY9UjpmhEhW/6NLc0sUqIFL+aQz8XJflDokk84d0LxGYfcA903xu0bY3hfBoy27YrNtA9d83HNcb9
	lUhe89f5dEanfwnccQw6Q1htDeH3AGmJl78KBAzCoIcdijeCzn9H9PW+NccQVmsnqFhg2rbcK7uR+
	s1zvuXXoK2desvfSODvNZ4FQz0BjTRlABNycsy52v96EzfJeEcPyBGN+n8q3pCMHfAf1OSG/1hCph
	4IzJzsATwM7qk84LJ0RLbyyi/bNIKA5FKrZ+/2Le3/kxSemxI6zw+pYs3MWL3Kw3QtyrJX3rsteso
	ZxBmt5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPtLX-007sZ2-HR; Thu, 03 Mar 2022 21:50:51 +0000
Received: from mail.efficios.com ([167.114.26.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPtLT-007sXi-S3
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 21:50:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 9341A3BA34D;
 Thu,  3 Mar 2022 16:50:39 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FNcizHtgH03F; Thu,  3 Mar 2022 16:50:39 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 0CB663BA48E;
 Thu,  3 Mar 2022 16:50:39 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 0CB663BA48E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1646344239;
 bh=5Ak4jvBXx81U1jTRbp2JdPhyUQc+sugHGdPaNzSxYn4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=jhlFQuNK2IFZO6sgUCHSwVmfwirkfEHwE9HUBmDVLlapRj3QGXQPHHfTXpvYJLzqn
 60fcFJtW68PtzcAJ1+PbfKQmH19v7XjgNLBJURkuZXIXyUX6BZ8Xyy+CLVDCPtekr/
 gMN05QFFGK61+QMENecPVfwpVqL5qyRlObD9p3nxuYPun3AHQbofUC/FjPTD93Wz8P
 w/huLED4Cs3U3Ke56eUDMiGo2aZAdmxup9o/xogavIz4VsGNuTdX3M208sF1c3yGxJ
 XnxJdYUcOvHNsdAELgw0rQ6Pwr/mkJQK8xenS/xOvHzohUdnTMc3IL2JKjvsyqnYbb
 Ec38k/9N6ye0g==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id S2tkeJ-pxiPy; Thu,  3 Mar 2022 16:50:39 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id F1A593BA509;
 Thu,  3 Mar 2022 16:50:38 -0500 (EST)
Date: Thu, 3 Mar 2022 16:50:38 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <214245560.121082.1646344238921.JavaMail.zimbra@efficios.com>
In-Reply-To: <CABvJ_xiSreWvQ5c+_XW8RWSWUvx69qNc7pwrKVWspg0C9Sy2NQ@mail.gmail.com>
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
 <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
 <CABvJ_xiSreWvQ5c+_XW8RWSWUvx69qNc7pwrKVWspg0C9Sy2NQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - FF97 (Linux)/8.8.15_GA_4232)
Thread-Topic: rseq/selftests: Add support for RISC-V
Thread-Index: UkSCfb5xQxFw6K85jNkRkH9GIlGuGA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_135048_304454_02B3B8F9 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

----- On Mar 3, 2022, at 2:16 AM, Vincent Chen vincent.chen@sifive.com wrote:

> On Thu, Mar 3, 2022 at 12:38 AM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
[...]

>> > +#if __ORDER_LITTLE_ENDIAN__ == 1234
>>
>> I think we'll want to standardize on this for endianness checking (same as
>> the updated uapi rseq.h):
>>
>> #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) :
>> defined(__LITTLE_ENDIAN)
>>
>> We may have to change rseq-mips.h in the rseq selftests to do the same as well
>> rather than
>> using "# ifdef __BIG_ENDIAN".
>>
> 
> OK, I can follow it. However, I found the endianness checking in
> include/uapi/linux/rseq.h is
> #if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) ||
> defined(__BIG_ENDIAN)
> 
> It is a little different than what you mentioned early. Should I
> follow the format in include/uapi/linux/rseq.h? or both formats are
> OK?
> 

The form "#if (defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN)) || defined(__BIG_ENDIAN)
is completely buggy. Don't use that.

I've sent the fix to Peter to remove the offending #if here:

https://lore.kernel.org/lkml/1445357149.71067.1643137248305.JavaMail.zimbra@efficios.com/T/#mbbad3961494feefb98cb6d092879e3ea41b33df8

Please use the correct non-bogus form instead:

#if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
