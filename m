Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ED3EE0ADC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epR8HsW9VbQgMlYGlLmrZan0CwUYALeY8rmKJn0enQc=; b=h0nAoIMTakmUU0
	L9oSG0agE19d2bYU/CzaJONR0hA1MZNZT3XJifJHAZvsoGiEXSCOx1cCzkfV3b+Z4veJ7cvNpUrZR
	WnuR6kuQ2J+wi5NiUu6n9Sfbv7ZIe1qciYQ4AFq5elBVW1nKJc9RsuxfS/28FygMnloLXI49ohKxb
	+EgGSTvvew9GHlu8Q9DathoMWy2ByKKfF7nBuEBfWnb2P9cTcr4LfBLBPRmvgyApuyN2nMK+oHj9U
	8oZNBVccjEWdhZFjrMF5mVFldOfs45TLIQPdEbgqMeZhtZC0YEZfJcrG1DLdnkBKLplYT4DGHqey5
	fJe3GJ6NUkDPJ1OEKI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiog-0000000CVki-0lev;
	Sat, 07 Feb 2026 13:57:42 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiod-0000000CVk4-28aw
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 13:57:41 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2ba64b5a53aso45696eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 05:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770472658; x=1771077458; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhLaNZ2KK6aNK9ALYGKaKSL8yESm+SSWbTP8mbgDklc=;
        b=FODfud2pfJ3gSlgnuXQq+KwNLhxBJLgBHoWVG18XYU7chkvlrq/6T7v6tixThpMLVv
         qlZ+aUk8nx6YwHsPhvhnE3m6LCAO2MP4pGxwb20ZsEyCyCrYRZ9tKvBG5CTcdJm+5SHY
         d6vmKzs86NF+Z1YlbqvC9cSjNnIwa6VQBLpBjt4D9Gp2S4X5eIFsIoR0F3wZJxSyRonP
         760LGF06pLywv2y546oGnyKT4fKIUjUZ8kDIgt0GKZGO863eFZ9nG15V1I4yLn7t98Uq
         rDbm/PPotzl8EOCe9TtZx+Q8veZGWOe6DMLLNfvTlnrvYpNcxJw0lZREGq9lCdZ2V2nV
         dnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770472658; x=1771077458;
        h=in-reply-to:references:cc:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhLaNZ2KK6aNK9ALYGKaKSL8yESm+SSWbTP8mbgDklc=;
        b=v+WGW6iMhpkq6zjURTIlvjlCIMjrWF6ifdmkcRnMqyBCL/7/EtsmfU/jMg5qXBfoGo
         vO/hSBb6syODZpOXu/fRNI/CmlW0PVY2YoJHRiolqp3MtkI1etiRVa8w3hYMtz4+6Kwv
         ltR5I0FFd61eMHt5HCccLyKFFseZIbsfPMDcDKhN+47I9/VTv3Uu9g8HUMBTDHgSrPMw
         IE46Kn967qH61kTBS6+5SAdy23jU2pKFnoNztPgUuAINSr7JzaWle3yCqnKXruQZD7Aj
         beiX1EV45hLZc7XFGBhtVYf+Tib5uuv83ycV7P3wFvT3NVSpcf5vdEdNzi6E4lpm+jyx
         tvLg==
X-Forwarded-Encrypted: i=1; AJvYcCUjHQwGVrfjRimaOWbFlmVfSVtBMlNQwtOr6A5EgnkvZ1rmX81UvrFidv4E43up6TX7PQcvPk3ASdlVXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwJrfmFnbBB4OBbySz8SPtLTWB9L7Tba4or3eYTP+hahvpJTC/
	dlJjJ4mqYDOWXbMW4c1zrKzxK5KUDlIw5tYoRMUurE8cwzV81VhMkVfmhchn7fFylZo=
X-Gm-Gg: AZuq6aKXIUZXm8/HW44G7BsOlpMcNcnkk5wsZmFZfqUY3luxbdo0cRUnCGDqORVzYvJ
	C/fZW2bZAn/rkIS6DrgBIXXNacSiSqMv2ksO0HwkS2cuWZJ1FXTGdJAfAAlA606c0KEJH99HJIW
	K2JIwc69euxf03Ik1bkig9vg9f6LzC1GFVHLSxTV9P67La/Aw1BV+ttY88ZeXrQeJFinxmITvVP
	xh3eyHFrCjVYmA8INfuNyqnYOhUizmh/Gx8T6b8xBQP23rudz0pfP/YThnxGFb71m0Ka+zQslyt
	ZseifZGj9ZHmSgiy8gMhF3e6+lHqt7Z4UeUBPVJZWfiqseRAErm/zyKIJUm+znc6EZLpzcZx1GC
	7AQrUj7EAAMpuoPSAR4Js4/vWCnJZy+xZ8KKYp3up8S+Aao4YJ7rP7KZYuKv2A++16hggtLflM8
	DD373vSffynLuM+A==
X-Received: by 2002:a05:7301:3f16:b0:2b7:ff39:30eb with SMTP id 5a478bee46e88-2b8560de163mr2076540eec.0.1770472658293;
        Sat, 07 Feb 2026 05:57:38 -0800 (PST)
Received: from localhost ([72.11.140.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad9a42sm4663573eec.1.2026.02.07.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:57:38 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Sat, 07 Feb 2026 21:57:34 +0800
Message-Id: <DG8S6DCW5EWZ.1F1IARVF5M6DZ@linux.spacemit.com>
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
To: "Alex Elder" <elder@riscstar.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Yixun Lan" <dlan@gentoo.org>, "Aurelien Jarno" <aurelien@aurel32.net>,
 "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Troy Mitchell"
 <troymitchell988@gmail.com>
Cc: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
 <5ddb55a9-ddad-4e4b-90ab-2214f958ea90@riscstar.com>
In-Reply-To: <5ddb55a9-ddad-4e4b-90ab-2214f958ea90@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_055739_563696_1D672451 
X-CRM114-Status: GOOD (  35.53  )
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

On Fri Jan 16, 2026 at 1:02 AM CST, Alex Elder wrote:
> On 1/8/26 1:52 AM, Troy Mitchell wrote:
>> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
>> enabling the use of I2C in atomic context.
>> 
>> When i2c xfer_atomic is invoked, use_pio is set accordingly.
>> 
>> Since an atomic context is required, all interrupts are disabled when
>> operating in PIO mode. Even with interrupts disabled, the bits in the
>> ISR (Interrupt Status Register) will still be set, so error handling can
>> be performed by polling the relevant status bits in the ISR.
>> 
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
> I have a few minor comments, but I think this is close to done.
>
>> ---
>> Changes in v6:
>> - modify code style
>> - modify and add comments
>> - Link to v5: https://lore.kernel.org/all/20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com/
>> ---
>> Changes in v5:
>> - optimize code logic
>> - refactor delay handling into spacemit_i2c_delay() helper
>> - introduce spacemit_i2c_complete() to centralize transfer completion
>> - rework PIO transfer wait logic for clarity and correctness
>> - modify and add some comments
>> - modify commit message
>> - Link to v4: https://lore.kernel.org/all/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/
>> 
>> Changes in v4:
>> - refactor for better readability: simplify condition check and moving if/else (timeout/
>>    wait_xfer_complete) logic into a function
>> - remove irrelevant changes
>> - remove the status clear call in spacemit_i2c_xfer_common()
>> - sort functions to avoid forward declarations,
>>    move unavoidable ones above function definitions
>> - use udelay() in atomic context to avoid sleeping
>> - wait for MSD on the last byte in wait_pio_xfer()
>> - Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com
>> 
>> Changes in v3:
>> - drop 1-5 patches (have been merged)
>> - modify commit message
>> - use readl_poll_timeout_atomic() in wait_pio_xfer()
>> - use msecs_to_jiffies() when get PIO mode timeout value
>> - factor out transfer state handling into spacemit_i2c_handle_state().
>> - do not disable/enable the controller IRQ around PIO transfers.
>> - consolidate spacemit_i2c_init() interrupt setup
>> - rename is_pio -> use_pio
>> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
>> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
>> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
>> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
>> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
>> 
>> Changes in v2:
>> - add is_pio judgement in irq_handler()
>> - use a fixed timeout value when PIO
>> - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
>> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
>> ---
>>   drivers/i2c/busses/i2c-k1.c | 304 +++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 232 insertions(+), 72 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>> index accef6653b56bd3505770328af17e441fad613a7..427cd8dc6947c1d5fbdd364a351f7c065ba0b595 100644
>> --- a/drivers/i2c/busses/i2c-k1.c
>> +++ b/drivers/i2c/busses/i2c-k1.c
>> @@ -97,6 +97,10 @@
>>   
>>   #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>>   
>> +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
>> +#define SPACEMIT_POLL_TIMEOUT      1000 /* us */
>> +#define SPACEMIT_POLL_INTERVAL	   30	/* us */
>> +
>>   enum spacemit_i2c_state {
>>   	SPACEMIT_STATE_IDLE,
>>   	SPACEMIT_STATE_START,
>> @@ -125,6 +129,7 @@ struct spacemit_i2c_dev {
>>   
>>   	enum spacemit_i2c_state state;
>>   	bool read;
>> +	bool use_pio;
>>   	struct completion complete;
>>   	u32 status;
>>   };
>> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>>   }
>>   
>> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
>> +				      unsigned int min_us,
>> +				      unsigned int max_us)
>> +{
>> +	if (i2c->use_pio)
>> +		udelay(max_us);
>> +	else
>> +		usleep_range(min_us, max_us);
>> +}
>> +
>>   static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>>   {
>>   	u32 status;
>> @@ -182,7 +197,8 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>>   		return;
>>   
>>   	spacemit_i2c_reset(i2c);
>> -	usleep_range(10, 20);
>> +
>> +	spacemit_i2c_delay(i2c, 10, 20);
>
> Is this delay specified for the hardware somewhere?  I.e.
> "one must wait at least 10 microseconds after a reset"?
>
> If so, the delay be moved into spacemit_i2c_reset().
This is the sole call site requiring a delay; we must ensure a
sufficient grace period before polling for bus release

>
>>   
>>   	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
>>   		status = readl(i2c->base + SPACEMIT_IBMR);
>> @@ -211,9 +227,15 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
>>   	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
>>   		return 0;
>>   
>> -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
>> -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
>> -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
>> +	if (i2c->use_pio)
>> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
>> +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
>> +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
>> +	else
>> +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
>> +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
>> +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
>> +
>>   	if (ret)
>>   		spacemit_i2c_reset(i2c);
>>   
>
> . . .
>
>> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	if (i2c->status & SPACEMIT_SR_ERR)
>> +		goto err_out;
>> +
>> +	val = readl(i2c->base + SPACEMIT_ICR);
>
> The assignment on the next line doesn't even matter and isn't
> used unless the state isn't idle.  You could move it inside
> the block below.  In fact, you don't even need to read the
> ICR value (above) until you have verified the state isn't idle.
Yes, you are correct.  The assignment is only used when the state
is not idle. And the register ICR will be cleared when the state is
idle (in err_check).

>
>> +	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
>> +
>> +	switch (i2c->state) {
>> +	case SPACEMIT_STATE_START:
>> +		spacemit_i2c_handle_start(i2c);
>> +		break;
>> +	case SPACEMIT_STATE_READ:
>> +		spacemit_i2c_handle_read(i2c);
>> +		break;
>> +	case SPACEMIT_STATE_WRITE:
>> +		spacemit_i2c_handle_write(i2c);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (i2c->state != SPACEMIT_STATE_IDLE) {
>> +		val |= SPACEMIT_CR_TB;
>> +		if (i2c->use_pio)
>> +			val |= SPACEMIT_CR_ALDIE;
>> +
>> +
>> +		if (spacemit_i2c_is_last_msg(i2c)) {
>> +			/* trigger next byte with stop */
>> +			val |= SPACEMIT_CR_STOP;
>> +
>> +			if (i2c->read)
>> +				val |= SPACEMIT_CR_ACKNAK;
>> +		}
>> +		writel(val, i2c->base + SPACEMIT_ICR);
>> +	}
>> +
>> +err_out:
>> +	spacemit_i2c_err_check(i2c);
>> +}
>> +
>> +/*
>> + * In PIO mode, this function is used as a replacement for
>> + * wait_for_completion_timeout(), whose return value indicates
>> + * the remaining time.
>> + *
>> + * We do not have a meaningful remaining-time value here, so
>> + * return a non-zero value on success to indicate "not timed out".
>> + * Returning 1 ensures callers treating the return value as
>> + * time_left will not incorrectly report a timeout.
>> + */
>> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
>> +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
>> +	int ret;
>> +
>> +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
>> +
>> +	do {
>> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
>> +
>> +		spacemit_i2c_clear_int_status(i2c, i2c->status);
>> +
>> +		if (!(i2c->status & mask)) {
>> +			udelay(SPACEMIT_POLL_INTERVAL);
>> +			continue;
>> +		}
>> +
>> +		spacemit_i2c_handle_state(i2c);
>
> This could be:
>
> 		if (i2c->status & mask)
> 			spacemit_i2c_handle_state(i2c);
> 		else
> 			udelay(SPACEMIT_POLL_INTERVAL);
I'll. Thanks.

                        - Troy
> 	} while...
>
>
> 					-Alex
>
>> +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
>> +
>> +	if (i2c->unprocessed)
>> +		return 0;
>> +
>> +	if (i2c->read)
>> +		return 1;
>
> . . .


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
