Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DF3CD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Mime-Version:Subject:
	In-Reply-To:Message-Id:From:Date:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si9Qy9CNq8csy05Su6mUKK4SNIisR5dFe0zBjp30cMw=; b=XOVfP38cb6Pest
	+DMQI5i+LUhbVtgqqnRcTZAx7bVTx8vHy2xtQdSSQvI2LWjNqteK3JoO02koMKSV1Ma5MyBBc0l/a
	A/fQevDS7WUce/0cC5lp1s/zGheXZhTuJcGq9f/L1nrcCWTjb3TqResi3QpA90ME0f61SfPiy3lqz
	otio4nawDU/sbSUnMnyqo4+js6XGVmz571NgpX5Se+KJD7KR5NvSY7LU2M9pWVunYZ8X3SAePCeVg
	GNfYqID4Ons6N6QNUGQiTyk1cNHGqv98ahuVQXOJCGlwAbLwkisMEcMsBKhiZp4TgXcdPxquFS7+g
	TCth+oAPao19qu5f/B3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPg1-00000000IGg-12JB;
	Fri, 05 Jun 2026 08:13:13 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPfx-00000000IGE-1uv4
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 08:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780647180; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=xYTHDl2AajBOqR+4sy4po6w/RbkMf3J7YI6AkJg4pU8=;
 b=OsbFaj1Htl7RtRr1AhYVwO72Q7rmq/39SAMI+ZIK5YspR6iHkMH6sJsuSl++O+oDayYH1W
 QS3N7evby93Qe4Ytmz+5vqvgZiNlGKH508NcliP7WH2TCZKChOdYRMy+LKeL4n4vGAhg/V
 X9PEG8TgogqP7BC/A4GnrSzVKgavYWnm2BIBXSPGCWHqeHUBjzywvEBND2pux2qnt1Uv/M
 GZXKihJKFEQDNGDofkxcxWIdRFNA2W6EosS9Sc0AUb7tNUfBX6uyCP5VP9GIAtFi+U/23u
 3NKBwuenAWFwt6LlamqciT2tFfag0U6LMcaoVqB8nJ4CB6djMUCzVJycCJNFLw==
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 5 Jun 2026 16:12:42 +0800
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <226fe0d0-3d05-4c6b-95fb-a058da2d4169@bytedance.com>
In-Reply-To: <4197ee54-6c69-cb72-5966-c60ba321a6fa@kernel.org>
User-Agent: Mozilla Thunderbird
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Subject: Re: [PATCH v1 2/2] riscv: stacktrace: Use %pB for backtrace display
Mime-Version: 1.0
References: <20260603115329.791603-1-qirui.001@bytedance.com> <20260603115329.791603-3-qirui.001@bytedance.com> <4197ee54-6c69-cb72-5966-c60ba321a6fa@kernel.org>
To: "Paul Walmsley" <pjw@kernel.org>
X-Lms-Return-Path: <lba+26a22850a+64a7b7+lists.infradead.org+qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_011309_593961_D6100619 
X-CRM114-Status: GOOD (  19.60  )
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

On 6/5/26 8:33 AM, Paul Walmsley wrote:
> On Wed, 3 Jun 2026, Rui Qi wrote:
> 
>> The print_trace_address callback uses print_ip_sym which formats
>> addresses with %pS. This does not adjust the address before symbol
>> lookup, so when a noreturn function (e.g. panic, do_exit) is the last
>> call in a function, the saved return address can point to the start of
>> the next function, and kallsyms resolves it to the wrong symbol.
>>
>> The kernel provides %pB (sprint_backtrace) specifically for this
>> purpose: it subtracts 1 from the address before symbol lookup, which
>> is sufficient to fall back into the calling function range. x86 uses
>> %pB in its printk_stack_address for the same reason.
>>
>> Replace print_ip_sym with a direct printk using %pB, matching the
>> pattern used by x86.
>>
>> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> 
> The Sashiko review mentions that the x86 backtrace code uses %pS for exact 
> instruction pointers coming from registers (show_regs_if_on_stack()), vs. 
> %pB for return addresses on the stack (printk_stack_address()):
> 
>     https://sashiko.dev/#/patchset/20260603115329.791603-1-qirui.001%40bytedance.com
> 
> Do we need to incorporate similar logic?
> 
> 
> - Paul

Hi Paul,

Yes, you are right. The Sashiko review raises a valid point that I
should have addressed in the original patch.

%pB subtracts 1 from the address before symbol lookup, which is correct
for return addresses but wrong for exact instruction pointers: if the
exact IP happens to be at offset 0 of a function, subtracting 1 causes
kallsyms to resolve it to the preceding function.

In walk_stackframe(), two kinds of addresses are passed to the callback:

Exact instruction pointers: instruction_pointer(regs) and the epc
from exception frames found during unwinding (when the return
address points into handle_exception..ret_from_exception_end).
These should use %pS.

Return addresses: frame->ra, regs->ra, task->thread.ra. These
should use %pB.

I have updated the patch to add an 'is_ra' parameter to the
walk_stackframe callback, indicating whether the address is a return
address.  print_trace_address() then uses %pB when is_ra is true and
%pS when is_ra is false, matching the x86 approach.

For the generic arch_stack_walk() path, since stack_trace_consume_fn
has a fixed 2-parameter signature, a thin wrapper (stack_walk_wrapper)
adapts between the two callback types, discarding the is_ra flag since
the generic stack trace infrastructure only records raw addresses.

One known limitation: the non-FP version of walk_stackframe() scans
the stack blindly and cannot distinguish pt_regs->epc values from
return addresses, so all stack-scanned values are treated as return
addresses (is_ra = true).  This means epc values from pt_regs
encountered during the scan may still use %pB incorrectly.  This is
an inherent limitation of the non-FP unwinder and not introduced by
this change; the FP version handles the epc case correctly.

The updated patch will be in v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
