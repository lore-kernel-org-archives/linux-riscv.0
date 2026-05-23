Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD3CCD5BB8
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLjAmH0BGp69jc2JcZDNjVXH7pbwcsQAiGIlbRmYeb0=; b=Xdn8xbs+Vb/Fio
	ymo2hJuOD2Q5GqwWMxzNJslZPaahvzmX91iGVC5TC1+s8WAzaw5Em+SHvCjuyGJkepr/J93ANREWJ
	CuKkwgnk8eKKmQWQomAUu+B6ziGEmHIX5obCWzUVdXA9teEeqH60OooZ9FzllgU2x0teQ0K+x583f
	VKe7htghdh6Lpju4F2BDywIqU9yuEoIMt5Yz5GIfkiade2+3J07Gm91qG/Etf1z8QPtmAFDBbFyLX
	DgL5WwH/6653DhNXttZCKPRxfbnOMoRBcpcL6MxfRVq8+uC0clY3Sg4YDCfP5nDIkMqvMdhqc5H+Y
	QiwcgyzGWC6cwzKRakzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrI5-0000000DjUg-2mGq;
	Sat, 23 May 2026 18:41:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrI1-0000000DjTa-2Igv
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 18:41:40 +0000
Received: from [198.18.0.1] (unknown [113.227.3.159])
	by APP-05 (Coremail) with SMTP id zQCowAB3BwvV9BFq6mFAEQ--.13013S2;
	Sun, 24 May 2026 02:41:26 +0800 (CST)
Message-ID: <6f54fc06-1a75-4910-82a5-172a42f34284@isrc.iscas.ac.cn>
Date: Sun, 24 May 2026 02:41:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf riscv: Fix discarded const qualifier in
 _get_field()
To: acme@kernel.org, namhyung@kernel.org
Cc: irogers@google.com, adrian.hunter@intel.com, palmer@dabbelt.com,
 pjw@kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
 <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
From: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
In-Reply-To: <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
X-CM-TRANSID: zQCowAB3BwvV9BFq6mFAEQ--.13013S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW8CF45urW3WFW7Cr4xXrb_yoW8Ar1rpr
	Z7Crs0k345Xw15C340vFW29FWUurs3Xaya9F4rA347Zrs8Gw1rtr4ftanxK3ZrXryUCr18
	ur13ury8Aw48AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07betCcUUUUU=
X-Originating-IP: [113.227.3.159]
X-CM-SenderInfo: hjxd0znlorv2ny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_114137_972553_77811999 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Arnaldo, Namhyung,

Just a gentle ping on this patch. It has received a Reviewed-by from Ian.
Could you please consider picking it up for perf-tools-next?

Thanks,
Li Guan

On 5/14/2026 2:07 AM, Li Guan wrote:
> The assignment of strrchr() return values to non-const char * variables
> triggers a -Werror=discarded-qualifiers warning when building with GCC 14.
> This happens because in newer glibc versions, strrchr() returns a
> const char * if the input string is const.
>
> Properly declare 'line2' and 'nl' as const char * to match the glibc
> function signature and ensure type safety. This avoids the need for
> explicit type casting and aligns with the design pattern of not
> modifying read-only memory in the perf tool.
>
> Signed-off-by: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
> ---
> v2:
>   - Drop the auxtrace decoupling and weak stub approach as they interfered
>     with the cross-platform analysis intent, per Ian's feedback.
>   - Focus on a clean fix for the const qualifier issue in RISC-V header.c
>     by properly declaring local variables as const.
>   - Use Li Guan as the preferred name format for consistency.
>   - Verified that this fix is not yet present in acme/perf-tools-next.
>
>   tools/perf/arch/riscv/util/header.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
> index 4b839203d4..891984e909 100644
> --- a/tools/perf/arch/riscv/util/header.c
> +++ b/tools/perf/arch/riscv/util/header.c
> @@ -19,7 +19,7 @@
>   
>   static char *_get_field(const char *line)
>   {
> -	char *line2, *nl;
> +	const char *line2, *nl;
>   
>   	line2 = strrchr(line, ' ');
>   	if (!line2)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
