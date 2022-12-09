Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C02C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5sONDRIPmAs4Wh0DwOXRiD4bSOjRixi/DRy/DPW80E=; b=0L/+n6w9whSSym
	R7dyfMkcLsWxD3xEzM7DmAkGyEJcofCmsp12M5gTLVK/Dt6r4uZYHEmAz9epfYUspaz+KEh7GERw9
	W0hfdZppc5/+Misxm6ysL7q5HmgKcYTkfMOfL2yiN4nRFdIm2eb/8n1Sc1FnFbUqd0n2ypvVvH2Io
	pTXKTwdieMGq7xTElqUwxVGT180BR+uCkOQP0H54/2avkor9hrn9yhbx53Twg9EVtfLqgNsaVuJyK
	wgodfh0uIRnW/f5b8CuVIwNefTO7t4K5r8SVqvDS592tK6Bahq291WXM/KyNv/KzO3LyZZ17ftRmR
	NKNCY5sFC/yvEw+uh0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3d3S-007t0R-2l; Fri, 09 Dec 2022 13:04:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3d3O-007syg-VK
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 13:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670591077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u/BEyjC9xsEH5NMQX3QDWEaGFLUECMG5L/7NnRTgxTM=;
	b=FUQYY8LQdhk/ecZC1ExD5QbUZFPUz5HaU7AgZayTlVm7pIK746mQBTOrF8EQ0+bIeTGNxY
	clMyfNEI7UEtmU0fK6a16QO7yp5zCUtCpyo7OE4W7C6KDWcm2QcKwkUy27PiQEy/M/ulZy
	GSiNBmUBUYhUiFTZE9VOsoLuIwbDY0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-2lafMJoeOx-4oHYu3gC_QQ-1; Fri, 09 Dec 2022 08:04:33 -0500
X-MC-Unique: 2lafMJoeOx-4oHYu3gC_QQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BCE41C087AA;
	Fri,  9 Dec 2022 13:04:31 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.168])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D689C15BA5;
	Fri,  9 Dec 2022 13:04:26 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Andrew Waterman <andrew@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  Vineet Gupta
 <vineetg@rivosinc.com>,  stillson@rivosinc.com,  Paul Walmsley
 <paul.walmsley@sifive.com>,  anup@brainfault.org,  atishp@atishpatra.org,
  guoren@kernel.org,  Conor Dooley <conor.dooley@microchip.com>,
  greentime.hu@sifive.com,  vincent.chen@sifive.com,  andy.chiu@sifive.com,
  arnd@kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  bjorn@kernel.org,
  libc-alpha@sourceware.org,  christoph.muellner@vrull.eu,  Aaron Durbin
 <adurbin@rivosinc.com>,  linux@rivosinc.com
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
References: <b1dae947-d52a-d28e-5ddc-c1ad6d29828c@rivosinc.com>
	<mhng-84ad9495-ef4b-4343-89ee-dfe45ab69ff7@palmer-ri-x1c9>
	<CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
	<877cz0nbce.fsf@oldenburg.str.redhat.com>
	<Y5MoPdYimQtqQvkM@bruce.bluespec.com>
	<874ju4lpum.fsf@oldenburg.str.redhat.com>
	<Y5MtTLtrDnCW6Dik@bruce.bluespec.com>
Date: Fri, 09 Dec 2022 14:04:23 +0100
In-Reply-To: <Y5MtTLtrDnCW6Dik@bruce.bluespec.com> (Darius Rad's message of
	"Fri, 9 Dec 2022 07:42:52 -0500")
Message-ID: <87zgbwk9t4.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_050439_104234_9EB3B315 
X-CRM114-Status: GOOD (  23.37  )
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

* Darius Rad:

> On Fri, Dec 09, 2022 at 01:32:33PM +0100, Florian Weimer via Libc-alpha wrote:
>> * Darius Rad:
>> 
>> > On Fri, Dec 09, 2022 at 11:02:57AM +0100, Florian Weimer wrote:
>> >> * Andrew Waterman:
>> >> 
>> >> > This suggests that ld.so, early-stage libc, or possibly both will need
>> >> > to make this prctl() call, perhaps by parsing the ELF headers of the
>> >> > binary and each library to determine if the V extension is used.
>> >> 
>> >> If the string functions use the V extension, it will be enabled
>> >> unconditionally.  So I don't see why it's okay for libc to trigger this
>> >> alleged UAPI change, when the kernel can't do it by default.
>> >> 
>> >
>> > Because the call to enable can fail and userspace needs to deal with that.
>> 
>> Failure is usually indicated by an AT_HWCAP or AT_HWCAP2 bit remaining
>> zero, or perhaps a special CPU register (although that is more unusual).
>
> That would indicate that the extension is not present, which is one of, but
> not the only way it can fail.

I think you should bring down the number of failure modes.  HWCAP has
the advantage that it communicates kernel/hypervisor/firmware/CPU
support in a single bit, which simplifies the programming model and
avoids hard-to-detect bugs.  It's not clear why it would be beneficial
to continue on ENOMEM failures here because the system must clearly be
in bad shape at this point, and launching a new process is very unlikely
to improve matters.  So I think the simpler programming model is the way
to go here.

> The vector extension relies on dynamically allocated memory in the kernel,
> which can fail.

But this failure can be reported as part of execve and clone.

> It also provides the opportunity for the kernel to deny access to the
> vector extension, perhaps due to administrative policy or other future
> mechanism.

HWCAP can do this, too.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
