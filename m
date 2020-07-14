Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF572C433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 18:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D18225AB
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 18:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUjnAECr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D18225AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l6AvGOcGV5a86pXmxYTQ0GJK10aXOwXsacuuY6auVSg=; b=YUjnAECr/qBUhdVE/DFWKdZy/
	ApqRQOzneldlC/ROEIQ8C7UhbPy/KCHHKd/M0xBuYZNxp28q8CQly1ojZWMmj4Pz6fcf5fxafyrNg
	p8B7/dVAVI0cn5vMv44Oth0M5W3PCJrjs7syV+nj4KAXG+Bzu4SqHdDt6gQD0Ils0OJHvhY+foHU5
	vUbFyzq8vibN/ns57AIahRHTaVvSkOFFvmK338PQ4KN+I+FHOQ1Arwf/CKU71yDbv1HJIs4JopcXv
	QEt1UzyZ6izppbZEHSbxdm1j5PauFNdCyQ9JmN5Q0df4pPgiQxu/7JPJQ44h+Au7hM2U96IcZYoIg
	NXo8aSysg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvPRl-0003av-L9; Tue, 14 Jul 2020 18:14:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvPRi-0003ZZ-Di; Tue, 14 Jul 2020 18:14:27 +0000
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A6A2225AA;
 Tue, 14 Jul 2020 18:14:18 +0000 (UTC)
Date: Tue, 14 Jul 2020 19:14:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 4/5] arm64: Use the generic devmem_is_allowed()
Message-ID: <20200714181415.GC10736@gaia>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
 <20200709211925.1926557-5-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709211925.1926557-5-palmer@dabbelt.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_141426_563939_28A7D764 
X-CRM114-Status: GOOD (  11.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com, ardb@kernel.org,
 matti.vaittinen@fi.rohmeurope.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, brendanhiggins@google.com,
 elver@google.com, glider@google.com, zong.li@sifive.com,
 mchehab+samsung@kernel.org, linux-riscv@lists.infradead.org,
 alex.shi@linux.alibaba.com, will@kernel.org, dan.j.williams@intel.com,
 linux-arch@vger.kernel.org, uwe@kleine-koenig.org, alex@ghiti.fr,
 takahiro.akashi@linaro.org, paulmck@kernel.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, rppt@linux.ibm.com,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, kernel-team@android.com,
 pmladek@suse.com, zaslonko@linux.ibm.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, rostedt@goodmis.org,
 broonie@kernel.org, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, mcgrof@kernel.org,
 james.morse@arm.com, mhiramat@kernel.org, akpm@linux-foundation.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 02:19:24PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> I recently copied this into lib/ for use by the RISC-V port.
> 
> [I haven't even build tested this.  The lib/ patch is on riscv/for-next,
> which I'm targeting for 5.9, so this won't work alone.  See the cover
> letter for more details.]
> 
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
