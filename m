Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45430CFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yltZy5bq8+PO7hotnl9f8zg4vWoXdFEmrryfc3FLr7s=; b=TF26ldw8TU3nVk
	1qh0NRZCFufmiObdrjm8UAPPgnQfekmxNR2fuBqmAg8+URz5q48nUAojtIFSPzwAGiUXuKUaCXqKE
	ldYKSnSFu/ePAp5dthU/agI46OocKj7zV322RuE3qRGWG0SEB1GNxcR9OuAHcsYVxWxP2bk43tXhf
	8xXLHyzGUp9bRdUKZbKv4JrWC0p0om8k4VijNjpezMvlEdATD6b9Z3dm5rSaMjgNMH+I59rGHFUT9
	vH4tUmq7w2X8BnUubwKNv2v+qZVPexiDqdTPVrGfq0eWQ2RgUBl8IzSQalkNH3TnIDQLiqncWUdZQ
	CGBtMRX45DPi7BVlUEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJok-00000004tvr-0MBD;
	Tue, 02 Dec 2025 06:24:54 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJoh-00000004tv3-3Ggp
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 06:24:53 +0000
Received: from [192.168.0.107] (unknown [114.241.82.59])
	by APP-01 (Coremail) with SMTP id qwCowABn_cwuhi5pmijUAg--.285S2;
	Tue, 02 Dec 2025 14:24:46 +0800 (CST)
Message-ID: <80cb6553-af8f-4fce-a010-dff3a33c3779@iscas.ac.cn>
Date: Tue, 2 Dec 2025 14:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jerry Shih <jerry.shih@sifive.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
 <20251202053119.GA1416@sol>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251202053119.GA1416@sol>
X-CM-TRANSID: qwCowABn_cwuhi5pmijUAg--.285S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDKr1xJw15tr1kGry3Arb_yoWfGrbEvr
	WYyrn7Cwn8WFnrtFyjkr4UtrWDGw1fWFyIgryrXwsrKrW8Zan5Zr1kZrn5Aw1Sqw42yF9F
	kr98Jay3W34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2VbyDUUUU
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_222452_208617_210C0D14 
X-CRM114-Status: UNSURE (   9.98  )
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

On 12/2/25 13:31, Eric Biggers wrote:
> On Tue, Dec 02, 2025 at 01:25:07PM +0800, Vivian Wang wrote:
>> In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
>> by reallocating KEY0 to t5. This makes stack traces available if e.g. a
>> crash happens in chacha_zvkb.
>>
>> No frame pointer maintenence is otherwise required since this is a leaf
>> function.
> maintenence => maintenance
>
Ouch... I swear I specifically checked this before sending, but
apparently didn't see this. Thanks for the catch.

>>  SYM_FUNC_START(chacha_zvkb)
>>  	addi		sp, sp, -96
>> -	sd		s0, 0(sp)
> I know it's annoying, but would you mind also changing the 96 to 88, and
> decreasing all the offsets by 8, so that we don't leave a hole in the
> stack where s0 used to be?  Likewise at the end of the function.

No can do. Stack alignment on RISC-V is 16 bytes, and 80 won't fit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
