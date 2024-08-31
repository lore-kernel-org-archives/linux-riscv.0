Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD4CCD1293
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWj+g7zqVF7kKk0FRYVoQ+wklHmtxDbJvJ4S0EtkPEM=; b=DcGl9b6xDAIoKW
	V+3CMjZFEgBhHOSm+GHTV73LlUSyO4kRGSbtgwilDClF/PTZV50qmd129g1ACOt+XcSk9oW0c7FyT
	JVxYRwjT0VxDkPBGfzXCqGTAykmikYLgwdgUmBgck81QeGcohOxSA79fRGj3FnRKTFU8H1L2fRq3j
	Jc18prqZdUXjCGBVpw6AGXkLt/Wtdq0wPLAGsTPJoEQBpYRqnYt/4vQCTpfQGQJXLE7q/34Bq6evI
	RKInGRYZhA/r/C/HIddWOGaaCK83Fh40VG7XyYd2oNTX/Plf5Y6KciaXD2zk6TEAFzbZTrfiIqImE
	j2zuTE5rkD6GbGyBt43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skIVm-00000008pVr-2Jfc;
	Sat, 31 Aug 2024 07:27:06 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skIVi-00000008pTm-0Ud5
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 07:27:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wwmm52Yv4z4f3l28
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 15:26:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id F3D941A058E
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 15:26:44 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgAHPLuzxdJmcpHTDA--.9841S2;
	Sat, 31 Aug 2024 15:26:44 +0800 (CST)
Message-ID: <2379c139-6457-49dc-84fa-0d60ce226f2a@huaweicloud.com>
Date: Sat, 31 Aug 2024 15:26:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/4] libbpf: Access first syscall argument
 with CO-RE direct read on arm64
Content-Language: en-US
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
 <20240831041934.1629216-3-pulehui@huaweicloud.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20240831041934.1629216-3-pulehui@huaweicloud.com>
X-CM-TRANSID: Syh0CgAHPLuzxdJmcpHTDA--.9841S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4DAr13tFWDGw47Kr4DArb_yoW8WFWrpa
	yUCa4UKw18Ww4jkasrKF4avrW3tws3trnrCFZ7W3yS9FWUK3yrWa42grs0kw4ay3yUtw4Y
	vr9Fkr18G3W7Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIa
	0PDUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_002702_804089_563D81F2 
X-CRM114-Status: GOOD (  11.73  )
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

On 8/31/2024 12:19 PM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Currently PT_REGS_PARM1 SYSCALL(x) is consistent with PT_REGS_PARM1_CORE
> SYSCALL(x), which will introduce the overhead of BPF_CORE_READ(), taking
> into account the read pt_regs comes directly from the context, let's use
> CO-RE direct read to access the first system call argument.
> 
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   tools/lib/bpf/bpf_tracing.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
> index e7d9382efeb3..051c408e6aed 100644
> --- a/tools/lib/bpf/bpf_tracing.h
> +++ b/tools/lib/bpf/bpf_tracing.h
> @@ -222,7 +222,7 @@ struct pt_regs___s390 {
>   
>   struct pt_regs___arm64 {
>   	unsigned long orig_x0;
> -};
> +} __attribute__((preserve_access_index));
>   
>   /* arm64 provides struct user_pt_regs instead of struct pt_regs to userspace */
>   #define __PT_REGS_CAST(x) ((const struct user_pt_regs *)(x))
> @@ -241,7 +241,7 @@ struct pt_regs___arm64 {
>   #define __PT_PARM4_SYSCALL_REG __PT_PARM4_REG
>   #define __PT_PARM5_SYSCALL_REG __PT_PARM5_REG
>   #define __PT_PARM6_SYSCALL_REG __PT_PARM6_REG
> -#define PT_REGS_PARM1_SYSCALL(x) PT_REGS_PARM1_CORE_SYSCALL(x)
> +#define PT_REGS_PARM1_SYSCALL(x) (((const struct pt_regs___arm64 *)(x))->orig_x0)
>   #define PT_REGS_PARM1_CORE_SYSCALL(x) \
>   	BPF_CORE_READ((const struct pt_regs___arm64 *)(x), __PT_PARM1_SYSCALL_REG)
>   

Cool!

Acked-by: Xu Kuohai <xukuohai@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
