Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30251CDE00E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLYjEc3wkeXUPkNeFTn9Z6ZzTCdbhxxUWDVEng9P5To=; b=O/KBntKLUJKbjy
	FmEKSMVFEqG7YnWeh1F3gwOoqVbs+GDZVXcUezWZcVJFAd2hhEfzLTwh2MnFWF0PylSJu/W4Uf/cG
	W31xgOlK71fZ+TtOoe1+Qqq7Gge1QfnqWuV2ObvWSLe/g3rL6r6PuijV6lYJCwLQtfXMHulttFHVk
	5JaxAofleQesXuy4WK34ty5lBUNttuJGVo9lAM/cxrYKYGZDbSm+iY5Wxcn15LG+6D62SRMjU+ELF
	nqyLpj55OksocD4WjOdSlUo11igAA9i82P8eVAdh8fMyj/Ae4I7dRXuUCZGOdT9OcPGgyjXbnPAht
	b6O1d0nrvAAj+TwsdfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcr3s-00000009pAu-2HKt;
	Thu, 25 Jun 2026 20:52:36 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcr3q-00000009pAN-1NII
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 20:52:35 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e92cb77209so168239a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782420753; x=1783025553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QpcdarrD5t9c5J5NcdgKMB6+v6n7Sm7nV3q/hZN1Z8=;
        b=IH6DDeCZjECs2/KQQM9dFi73CAvXng4d/MgW2E0wj5RN5nq90TYUSzj9bZn0XZ4Nu4
         htr0MVp3wKu3Hk5MzfsA0hpBkmZr4oA2/G+tvfACTcV9NByyTf2oKJMh8cLLekrruu4R
         XptgOL6uO+m+auWVQnA8X3ttjcTP7vfE4Onq/fyt25OBj8DO9rUHyAl6b05cyCxX3LsZ
         9LwlbWsSWAnUCkX0PYwt77Ttg95IKzYtecE+3SzRrqHG5JQeqQJgk7O7YfT7XAE2kWVx
         4J38LWyr0jQEm/u5HRU6wDMfrk8YXv+g+XjPVAgw4GyZd8j0g6V33g1FHklvPwCa8kBG
         dQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420753; x=1783025553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QpcdarrD5t9c5J5NcdgKMB6+v6n7Sm7nV3q/hZN1Z8=;
        b=CAwkkrVmeRc0lhAYX4SdAb77KN5h/fOcX/D3p+cWiSoGm7TRsJGNaCDMGbfMlEO1vj
         4ggIcs7VUr5klQFTJ0ndUBjRCqLeIWLv9w/lJpYM67Rva+xZUzoa8cLlQn5MOox5y0mq
         RlsPmP3bv3H6C23bNG66EPeqIGT4ckCrzLvXyO4X1aRDViwG/26S8oya/LKdDRNBi3ry
         8T8nJ4hhEENB9bDaybhsHFpttLLvVC6JVUXShkZxJQ/Um93dN0BMGUhLHPk9sjfW21j+
         IhE0qPUVyC4DnexMi0lFKhoyd61T8tT1A5RUgtSF/esr1YigcmfMED2A0+L+XwOb16Gp
         KIUA==
X-Gm-Message-State: AOJu0Yxk7uUd8OuoncezKD5mky7Cy/sjJZPd7ugZDomSKqjWwFBvR12x
	3sPu5jA5iIgdmFWaLm8ZwfW3NoKiEG4fZcc1JkhW1ICqkJg+rICFvxtyJlrMpC+EWVA=
X-Gm-Gg: AfdE7ckBRCWyLkv81buwsTkc0fu/fuIROTby+YDChWHnyvvaZaRGEpyP+BJrL0Z+Vyd
	pW2aK9hvlDOLjjZdhhHN4nfXB6Fzpplky+WMWw3m/Fmo1kdQ3yFeEnHrcUWE2FPSa+Q7FFOke5N
	qqoJ9zOxGLM/5WWIV0gBINmcqgAalKiglNikbz1Wi2EJ1RuPOSZGTekn7iDzNwUB174pxKwQHjp
	izBUDIwiXzgFXmTRCN5CLKEyDYaswyzHIw4mHFSHGD63jkvvX4T0Ot7n9zCNmVQQBUxyanRQREP
	lPLL6EcySSbREwZxCuCOH/O/uaU7MgNTcGmRnBNF1NY4m44qG0misJs5AGFJe+MHQHd3JBF/ZUd
	BSokIiLCS2hmhlR0SWTkDC72TpKNtroWDeh4aof6IUb/s8bRskiHZAmQ5SvT6UYhC8WgzwemTWc
	tFRbxy70ulfbnUqcj5CHFWIoKzY7YeO3Rn3OOe2Q==
X-Received: by 2002:a05:6830:8295:b0:7e7:352:2f75 with SMTP id 46e09a7af769-7e99c2ccb24mr4213389a34.21.1782420752836;
        Thu, 25 Jun 2026 13:52:32 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.102.173])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5fe07csm94364a34.12.2026.06.25.13.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 13:52:32 -0700 (PDT)
Message-ID: <8ac42c36-a8b8-4136-8173-c1cfa519cb2f@sifive.com>
Date: Thu, 25 Jun 2026 15:52:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
To: Nam Cao <namcao@linutronix.de>, Michael Ellerman <mpe@kernel.org>,
 Rui Qi <qirui.001@bytedance.com>, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260624113148.3723541-1-qirui.001@bytedance.com>
 <2e47388a-8883-4b44-b440-a00b8e622733@kernel.org>
 <87pl1fvwce.fsf@yellow.woof>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87pl1fvwce.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_135234_381291_A41EFFD5 
X-CRM114-Status: GOOD (  18.43  )
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

On 2026-06-25 3:49 AM, Nam Cao wrote:
> Michael Ellerman <mpe@kernel.org> writes:
>> On 24/6/26 9:31 pm, Rui Qi wrote:
>>> call_on_irq_stack() uses struct member offsets to set up its link in the
>>> frame record list. On riscv32, struct stackframe is the wrong size to
>>> maintain stack pointer alignment, so STACKFRAME_SIZE_ON_STACK includes
>>> padding. However, the ABI requires the frame record to be placed
>>> immediately below the address stored in s0, so the padding must come
>>> before the struct members.
>>>
>>> Fix the layout by making STACKFRAME_FP and STACKFRAME_RA the negative
>>> offsets from s0, instead of the positive offsets from sp.
>>
>> The fact that all uses of the defines need to add back STACKFRAME_SIZE_ON_STACK
>> makes me think the defines don't have the most useful values.
>>
>> If the values were offset + padding then the uses could be left unchanged.

The reason for choosing the definitions in the patch is to match the ABI[1],
which defines the fields at negative offsets from the frame pointer: "This puts
the return address at fp - PTRSZ/8, and the previous frame pointer at fp - 2 *
PTRSZ/8"

In call_on_irq_stack(), the frame pointer is (sp + STACKFRAME_SIZE_ON_STACK). So
the restore code could equivalently be written as:

    REG_L    ra, STACKFRAME_RA(s0)
    REG_L    s0, STACKFRAME_FP(s0)

which is nice and clean and works everywhere, but the save code can't be as
clean due to needing both the old and new frame pointer value at the same time.
So it either needs a temporary register for the new stack pointer, or to do the
calculation in the assembly, and I chose the latter; and I preferred to make the
save/restore code visually consistent.

[1]:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention

> At the moment we only have only one user which has nothing except the
> stack frame on the stack. Other potential users do not necessarily add back
> STACKFRAME_SIZE_ON_STACK.
> 
> The offset value depends on the function. So I think it's better to
> leave that offset calculation to users.

Indeed, a later patch in the original series allocated space for both struct
stackframe and struct pt_regs at the same time.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
