Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03769C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 18:57:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586D064EEC
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 18:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 586D064EEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tpy5AWV9omwLt4wUdXMFphFocy7ekm2FspSXsrjC3fk=; b=GCYPHiNx9jbC6pa4XN7rLdD/Y
	u9nVzE7/zeAu+ecuyJp9tYgVTqEdqmWIMAUsxBqftm0wbGbXMYdzdtTvPxLJ5TTomKoJ86LMRrEbA
	iZmLo1XzL9EzLbLki0NBrK7bg36xKxNWDx3lHAu/pzjmHUOo6+KRcBXbNMIFick1Py2H0KJXBjWjO
	x2Qr4TJqhemFICjng+xaHSdClM/H8k3Kp04T0E7QJW+0lGZ6VmbnL1XJ/XzhsYvo8jISezlk5IAqT
	IUcYGb9MuqKQGIlLHmj6i01h0YWPwGj9RHiOhlN6ABJhy31LH79c93euMf81VGUKe0PahePmthYdF
	XNvHUp3HA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWg0-0066tK-26; Wed, 03 Mar 2021 18:56:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT23-005HZU-DU
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 15:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=8C3Cqmimmjwa/poGf0+zFpaHzjPFUIHGwNdhcuFf2Jk=; b=GZWMQEy607vcSftgym4bKoIKIG
 jhSEW7J5F12yGMBHadj/+GmkLnf3OC7rF9OOzehQY+uDtMhZcvf1cxTYRYDc2SYO12j/alrJJelPW
 iz+PKogugPZ4q6yU8u0p8oqmx88llCDJd5DnIPo6XaOafArVgYi+EBSFrT+x7TLj53/WcSoX6yyOn
 6ivQRWGVzZPtO7sQkRVckUrAkah5is1lsDwwwYkBNmzKgvdwCIU4mkRxfyHh89tRnVIfBSC6Pg3lo
 1W0E3Ee38zBP3wm4sJF0K6tXjBUOM7fUT1Fi+0J8ymTqpwAeeLWN3q8ohPZGmy9cd38CZ/adtAO/6
 e721buwA==;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lHGhm-000ug5-4j
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 01:53:42 +0000
Received: from [10.130.0.135] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmdT_6z5gCpkTAA--.24602S3; 
 Wed, 03 Mar 2021 09:53:04 +0800 (CST)
Subject: Re: [PATCH] riscv: Return -EFAULT if copy_to_user() failed in signal.c
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <1614670097-28536-1-git-send-email-yangtiezhu@loongson.cn>
 <aa84cddb-9c04-3bad-49de-2fb3056ec44a@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <07aa690f-b37d-7d91-414f-f5dfda98a868@loongson.cn>
Date: Wed, 3 Mar 2021 09:53:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <aa84cddb-9c04-3bad-49de-2fb3056ec44a@codethink.co.uk>
X-CM-TRANSID: AQAAf9AxmdT_6z5gCpkTAA--.24602S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4Dur1xurW8CrWrKrW7Jwb_yoWrKrW5pF
 4UCa4akrW7Jrn2vF92vw1rua4rArn3tFy8Kr90k3WfAFs0qr45K34kta4jgF4rJry8Ca1v
 kFyqkry5Can8WrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JV
 WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjxUgGNtDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_015342_391948_2EB8204A 
X-CRM114-Status: GOOD (  26.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/02/2021 06:01 PM, Ben Dooks wrote:
> On 02/03/2021 07:28, Tiezhu Yang wrote:
>> copy_to_user() returns the amount left to copy, it should return -EFAULT
>> if copy to user failed.
>
> This looks technically correct, but the caller (only one)
> will check for non-zero and will covert that to -EFAULT
> in setup_rt_frame().

Yes, as you said, the original code logic has no problem, it will covert
that to -EFAULT in setup_rt_frame().

The initial aim of this patch is to make save_fp_state() return error code
if __copy_to_user() failed, just like it returns -EFAULT if __put_user() 
failed.

I notice that restore_fp_state() has similar issue, it will return -EFAULT
if __get_user() failed and maybe return -EINVAL in the other error case,
both -EFAULT and -EINVAL are error code, but when __copy_from_user() failed,
it does not return an error code, which seems not so consistent.

>
> I expect if this change is done, it also needs to be done
> for the callers too and there's a few others than assume
> !=0 is an error.
>
> I think it would be easier to define save_fp_state() to
> return non-zero on error and note it does not return an
> error code. It may be worth exiting the functio nif
> the first __copy_to_user fails?

Now,
(1) is it necessary to do some changes? If yes, I will send v2 later.
Like this:

[PATCH v2] riscv: Return -EFAULT if copy_{to,from}_user() failed in
  signal.c

copy_{to,from}_user() returns the amount left to copy, it should return
-EFAULT error code if copy {to,from} user failed, just like the return
value is an error code when {put,get}_user() failed, this is to make the
return value consistent, no function change.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
  arch/riscv/kernel/signal.c | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 65942b3..c76d877 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -39,7 +39,7 @@ static long restore_fp_state(struct pt_regs *regs,

      err = __copy_from_user(&current->thread.fstate, state, 
sizeof(*state));
      if (unlikely(err))
-        return err;
+        return -EFAULT;

      fstate_restore(current, regs);

@@ -67,7 +67,7 @@ static long save_fp_state(struct pt_regs *regs,
      fstate_save(current, regs);
      err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
      if (unlikely(err))
-        return err;
+        return -EFAULT;

      /* We support no other extension state at this time. */
      for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
@@ -87,8 +87,12 @@ static long restore_sigcontext(struct pt_regs *regs,
      struct sigcontext __user *sc)
  {
      long err;
+
      /* sc_regs is structured the same as the start of pt_regs */
      err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+    if (unlikely(err))
+        return -EFAULT;
+
      /* Restore the floating-point state. */
      if (has_fpu)
          err |= restore_fp_state(regs, &sc->sc_fpregs);
@@ -140,8 +144,12 @@ static long setup_sigcontext(struct rt_sigframe 
__user *frame,
  {
      struct sigcontext __user *sc = &frame->uc.uc_mcontext;
      long err;
+
      /* sc_regs is structured the same as the start of pt_regs */
      err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
+    if (unlikely(err))
+        return -EFAULT;
+
      /* Save the floating-point state. */
      if (has_fpu)
          err |= save_fp_state(regs, &sc->sc_fpregs);
-- 
2.1.0

(2) or just leave it as it is and ignore this patch?

Thanks,
Tiezhu

>
> Note: setup_rt_frame -> setup_sigcontext -> save_fp_frame
>
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/riscv/kernel/signal.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
>> index 65942b3..2238fc5 100644
>> --- a/arch/riscv/kernel/signal.c
>> +++ b/arch/riscv/kernel/signal.c
>> @@ -67,7 +67,7 @@ static long save_fp_state(struct pt_regs *regs,
>>       fstate_save(current, regs);
>>       err = __copy_to_user(state, &current->thread.fstate, 
>> sizeof(*state));
>>       if (unlikely(err))
>> -        return err;
>> +        return -EFAULT;
>>         /* We support no other extension state at this time. */
>>       for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
>> @@ -140,8 +140,12 @@ static long setup_sigcontext(struct rt_sigframe 
>> __user *frame,
>>   {
>>       struct sigcontext __user *sc = &frame->uc.uc_mcontext;
>>       long err;
>> +
>>       /* sc_regs is structured the same as the start of pt_regs */
>>       err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>> +    if (unlikely(err))
>> +        return -EFAULT;
>> +
>>       /* Save the floating-point state. */
>>       if (has_fpu)
>>           err |= save_fp_state(regs, &sc->sc_fpregs);
>>
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
