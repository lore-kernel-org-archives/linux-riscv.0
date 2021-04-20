Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A42C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 14:33:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A7D61249
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 14:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A7D61249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yvHPdgZPJ5Q2XuBvjwxaFKQ/54qck1pnGT9hkg4Hd1E=; b=bI7i4+5v93RTj0z8ysIkANe+o
	wRe2CStgPpnGUq3l5YzGkhq7K1ITdRHe8nJHCAHacKF8TOLJxYCH80FKpqI8W+WJeqteQCjPAvP6b
	VxKa5vC9kQDXub1UoDlsjV1ogps0ETOs0wfqR8wkvu0VNe47hJtvbpq1VJ8s5K5ruik1qQqlm5e/Z
	rb9d0ZzyQK2YEdsuc2usUUc76B3o7+YV+z0DjKxlAZWUPOd+SkfZcUNzAh26WM450oGhBNHhaUlZv
	B3MfRmW/maDRh2NgcMCbLn6DoGYcD5QEykY+ixeRDzO9aU/h9o4LhzNFtQpg8hXzisRNl9EECMla3
	OvWMD5FCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrQz-00CLz0-E1; Tue, 20 Apr 2021 14:33:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrQx-00CLyo-G7
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 14:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=R76dxxUw7tDGrUVAKnqj+hug1u/dU6JctvD711tXjhs=; b=4gXwGQ5UQYREnIlD2n+JKEmzd1
 kXEiwC23/Be+epEW6LqyeljVWC9p0hZOr6zaWQRw3b9LuWNOJdNRi4AmHD9CjNbGRMHnJiDdy8VJg
 kp9LEstL2S1XQsRasrY9GlrrlnbqkJSz6X5lPvlMa8L7SLN5Sl6fZJW/8TgtiumYOBo3bWULsjOGS
 etYbZNUpNE/laZYUehoprWd/ZKSLI8/7Fzr/qvIfx9bKu5iJREnK7jnFFT/Cvt1RIJ++isb2DQf3x
 C4i4gvTtLifohLI4J+GYqDDOtoVsHHDAP2tXZoTrehlBpFKlxQISgdjvO+RN8DUoU7gl/kDcdvSVR
 7+q5ZfqQ==;
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrQu-00CCGK-J1
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 14:32:58 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIxBa-1lERy42juM-00KQlg for <linux-riscv@lists.infradead.org>; Tue, 20 Apr
 2021 16:32:50 +0200
Received: by mail-wr1-f50.google.com with SMTP id j5so36880028wrn.4
 for <linux-riscv@lists.infradead.org>; Tue, 20 Apr 2021 07:32:50 -0700 (PDT)
X-Gm-Message-State: AOAM5302koKZbmk/+rU1oy1iY/Wt6xfZ5hrIEAb+oPvHhWF/skP57rWG
 +EweDA/4naQM+Olv602HGH+OLuTQvMv/m70BMBY=
X-Google-Smtp-Source: ABdhPJx9jCblaoPk1DZ/dDmC1vuUbz/Q0EccVnjqd/GOO86aSxcff75LZUey862d3CFtrmxEPKH5z/JxdSICQeP55A0=
X-Received: by 2002:adf:e483:: with SMTP id i3mr21737991wrm.286.1618929170116; 
 Tue, 20 Apr 2021 07:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
 <1618925829-90071-2-git-send-email-guoren@kernel.org>
In-Reply-To: <1618925829-90071-2-git-send-email-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 20 Apr 2021 16:32:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1aNDomNiX7W1USWnmdw1VR21ALX7NvJYGW9LBO+jvA4A@mail.gmail.com>
Message-ID: <CAK8P3a1aNDomNiX7W1USWnmdw1VR21ALX7NvJYGW9LBO+jvA4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] nios2: Cleanup deprecated function strlen_user
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:V3iyIRXHRd+kIQqWyVi3sgDr8sZ4eNsdk0MEzBMnmko5Rfxj7/3
 BApkunM5XM03tZVNi5wqdHQ0uToVFQuPr/AoB39sScc1cWV+rKfn73nxWHa8ysUQH9F6vDn
 wu1OWHvLrU3Ist3K380i3t8h7huLK4sYojF5IAYP96BPsCAJQQKMNpv2nfQBALGny3PtAcE
 fM9DA8j/TPdBXfHtw4VOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:daDWEnA3jtg=:Y1qea27wYCSGu8WesOBh5Z
 XbH28yNveJjWeyn5HpdVIW6VtnwMrJYrOo3T11JKuHxiDW26l2H8DGifRQ7Gzjlq2YbeM/RBs
 TJPeM9EF7WdIHgd8Y8fKCPLnHz3Y3rd3Cicalo/5EauAHYV05kFdzEaQ1EE51N5a5VMyTnEUP
 CMjGP1sK41AnvdzkQ/e4K5ltssum7zUE0I93YGh7rHSVZC7lOWTRfej7MxBcikUFuLi+gw0R+
 tizdNsIWxt/sMAffGbiP4pzoXOPOaGnxnulf/pENAbEsp/pRlGtScEAtXMQpDBKyLXb6ulVen
 /fkev1gyxyojaPAe3bSGEm0VAn62YUaTmqDyDj+baWBgd05x9f2eHm7ampPx/qKgE2Z/rBL7V
 s/kc+YkengjFYvwjmi3OkenXkaiQQKIAeN7iHa0MXwRxQR0SsuGaJ2E+VBrGUxpqVbxKnZ9XO
 7CC60SYH6lZ7snXslrBOXVo3GFVjNLMzQpZ1K6R6MiO1DPfW48NYtnwOOHPOgCSBQOCiy8r73
 350f+lxZBcNRV9FkaUbVU8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_073256_941719_1985B903 
X-CRM114-Status: GOOD (  12.01  )
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

On Tue, Apr 20, 2021 at 3:37 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> $ grep strlen_user * -r
> arch/csky/include/asm/uaccess.h:#define strlen_user(str) strnlen_user(str, 32767)
> arch/csky/lib/usercopy.c: * strlen_user: - Get the size of a string in user space.
> arch/ia64/lib/strlen.S: // Please note that in the case of strlen() as opposed to strlen_user()
> arch/mips/lib/strnlen_user.S: *  make strlen_user and strnlen_user access the first few KSEG0
> arch/nds32/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user * str);
> arch/nios2/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user *str);
> arch/riscv/include/asm/uaccess.h:extern long __must_check strlen_user(const char __user *str);
> kernel/trace/trace_probe_tmpl.h:static nokprobe_inline int fetch_store_strlen_user(unsigned long addr);
> kernel/trace/trace_probe_tmpl.h:                        ret += fetch_store_strlen_user(val + code->offset);
> kernel/trace/trace_uprobe.c:fetch_store_strlen_user(unsigned long addr)
> kernel/trace/trace_kprobe.c:fetch_store_strlen_user(unsigned long addr)
> kernel/trace/trace_kprobe.c:            return fetch_store_strlen_user(addr);

I would suggest using "grep strlen_user * -rw", to let the whole-word match
filter out the irrelevant ones for the changelog.

> See grep result, nobody uses it.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>

All three patches

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Do you want me to pick them up in the asm-generic tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
