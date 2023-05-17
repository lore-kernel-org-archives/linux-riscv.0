Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D1C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILz9yt8odXHChV9EEwGKWXDBjIwNxF8ys0mtxgImb5o=; b=cWAQr8H+ZXWAdZ
	Uz1bjap4MBbd5pfe5r5IY1UUyY9f0obBaIiltuvYVm9arA6tAMgezJbk5oC02phyrO41cFysGrjAD
	aE06nCNBljfUoXH3WWhgOQlrzwL91juLUtYZl+IYjS9j15TdC0Q3dHtMoOYPnVQ/4NusnRyrT8sRS
	vyIGHkkcAMr5AMf5G+/EzpGyx9Dja3U9yc6ExpLTfZJDZCp7psYn45kMWMidFsXzUcnpS9+bRLPAw
	sFqMIvTu8MACft4nV3bqCgzbJxP8HRFjYD2w8Job9ndZkY8WiyBX8S8A4O4tcHtKM41r6RWSn1wgp
	X0ZRHtjhQ2sQFjWtUfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEhF-009TZf-0g;
	Wed, 17 May 2023 10:47:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEhC-009TY1-09
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:47:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3075e802738so564792f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684320465; x=1686912465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqvkmynEV6/dEj1F324kSuUIEax/RriRwvtPl5SBD9Q=;
        b=DOV6yM9dgDqxu/o3argXq7spycp9mQOqF4YFCCozRgcJGMQsomFhVXykW6RfhwpEiv
         /a0f2cTkEepZnT5QgNXf6RvLzzvSTWoL3P8Z7Gpx1I/muxcTBMVR7MDYXWnMXnxzmRMe
         VVg3i4z3QFNpTD2MMb0J7LWn3oHMsgaN+mQIG3cRjsDS48ZqfNyVAv9/qBYvzkYzyZr9
         dP8SJvZrVYNW0sNEHZpQRnv+MwzSP83lXswk9OCHG95Tw24QwwkZSeYT8hX8qu/CYbaG
         tgOzYr1po54vgH0Ki+BM7IZ3IeaMHl/yIlAjowj8b7gZ4s1UsQWjCCTW10o3+M2iAfOp
         oijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320465; x=1686912465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqvkmynEV6/dEj1F324kSuUIEax/RriRwvtPl5SBD9Q=;
        b=YKoEmu+pPr5jzRZMOaarQ0YLjvcYEjzuf+01HGMvyckEuMJb/4NpvnIDhQPSEPespT
         Zgm2xXl8DPE8faNHYfgiyK2E2yWdKU4PAIbg4cmakzsstKBqQJu2fesNolmM4K09mK21
         puAt8mWW+nzpUjPdiA3uIjrkZ41AsnkkpVNtuJJWpKlqiAnxwguRZE6sOMn8aYBt+qXf
         KCsmq5SC1FwMgCm3G3WWu5gXkMj8zJbJHaM01yW8IyfcycK9VbygLdAer4CF/ZSR47nb
         LJ2tYzKonpqdEtvB3h+hcKSWzyL6lbXJuWMipU0JcrXU/rTdjCbVBgm6noXyGKZ7aJ9n
         kLeQ==
X-Gm-Message-State: AC+VfDyONcnAf/QpKIGtwbQZwX0ud3A1m4ofd3mGY/yYBK/0suwTQlm0
	cU65Xey0oK9gbIcTaBP1zN8=
X-Google-Smtp-Source: ACHHUZ471C3w5wFUGqIt4z27L/T2S6UBevOn16Z1o3xjez4iuEJaWtfcI8ywEBpGacqYJ2cij8Y9bA==
X-Received: by 2002:adf:f8d1:0:b0:307:8b3e:285a with SMTP id f17-20020adff8d1000000b003078b3e285amr261055wrq.67.1684320465184;
        Wed, 17 May 2023 03:47:45 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id g3-20020a5d6983000000b002ff2c39d072sm2334322wru.104.2023.05.17.03.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:47:44 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 17 May 2023 12:47:42 +0200
To: Ze Gao <zegao2021@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
Message-ID: <ZGSwzuM8oHgKaaga@krava>
References: <20230517034510.15639-1-zegao@tencent.com>
 <20230517034510.15639-3-zegao@tencent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517034510.15639-3-zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_034750_085610_0D0617F6 
X-CRM114-Status: GOOD (  23.12  )
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

On Wed, May 17, 2023 at 11:45:07AM +0800, Ze Gao wrote:
> Current implementation calls kprobe related functions before doing
> ftrace recursion check in fprobe_kprobe_handler, which opens door
> to kernel crash due to stack recursion if preempt_count_{add, sub}
> is traceable in kprobe_busy_{begin, end}.
> 
> Things goes like this without this patch quoted from Steven:
> "
> fprobe_kprobe_handler() {
>    kprobe_busy_begin() {
>       preempt_disable() {
>          preempt_count_add() {  <-- trace
>             fprobe_kprobe_handler() {
> 		[ wash, rinse, repeat, CRASH!!! ]
> "
> 
> By refactoring the common part out of fprobe_kprobe_handler and
> fprobe_handler and call ftrace recursion detection at the very beginning,
> the whole fprobe_kprobe_handler is free from recursion.
> 
> Signed-off-by: Ze Gao <zegao@tencent.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-3-zegao@tencent.com
> ---
>  kernel/trace/fprobe.c | 59 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> index 9abb3905bc8e..097c740799ba 100644
> --- a/kernel/trace/fprobe.c
> +++ b/kernel/trace/fprobe.c
> @@ -20,30 +20,22 @@ struct fprobe_rethook_node {
>  	char data[];
>  };
>  
> -static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
> -			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
> +static inline void __fprobe_handler(unsigned long ip, unsigned long
> +		parent_ip, struct ftrace_ops *ops, struct ftrace_regs *fregs)
>  {
>  	struct fprobe_rethook_node *fpr;
>  	struct rethook_node *rh = NULL;
>  	struct fprobe *fp;
>  	void *entry_data = NULL;
> -	int bit, ret;
> +	int ret;
>  

this change uncovered bug for me introduced by [1]

the bpf's kprobe multi uses either fprobe's entry_handler or exit_handler,
so the 'ret' value is undefined for return probe path and occasionally we
won't setup rethook and miss the return probe

we can either squash this change into your patch or I can make separate
patch for that.. but given that [1] is quite recent we could just silently
fix that ;-)

jirka


[1] 39d954200bf6 fprobe: Skip exit_handler if entry_handler returns !0

---
diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 9abb3905bc8e..293184227394 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -27,7 +27,7 @@ static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
 	struct rethook_node *rh = NULL;
 	struct fprobe *fp;
 	void *entry_data = NULL;
-	int bit, ret;
+	int bit, ret = 0;
 
 	fp = container_of(ops, struct fprobe, ops);
 	if (fprobe_disabled(fp))



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
