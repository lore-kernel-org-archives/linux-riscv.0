Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD980C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1b6wtJeySyb9aC8e/tIDUkRI18nBu8kYmvbwwvgnSU=; b=uabwlY7rphBSa+
	5Z09o+mMpLF/l6SYBNaLoO5veQ2Q+gq1kJhYipSFWq6ALKbayB9hNRR+GPqxBCw2m1aP1ASeCO6AT
	lPfdJgsnbMZk9HTiMEcslJOzGaEfK9Rl9zgZzOfLhTZEVcVEqrVt0F5YqO0Ojtc+x0dZUL32mOK8q
	yIV4tolfAeC/Rcf16nO+tlYfnoqKM74DPoKm2r164Pmqdy8D9l5k3QeNKEpbKvmUdbCwDjGUUP42F
	FozSrhe5StzgKt6ZGfKsPd2MEcFo03YOlJz5kX114woDmtIFgCeN9jwKPW+PKL1AHGmFcxtlkiFqn
	95v70ET26Vv2FXuLoL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJAw-00EpjR-4x; Thu, 22 Sep 2022 10:11:22 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ9J-00EoDc-Ja
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 10:09:43 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id a129so9779560vsc.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rXYQao7eqgpJ8yFCJfVW72NnGbdt1aa3bK5h76VLyPc=;
        b=UMRT5rt7MMxvw0quM5dGn7W+GhePsfVdIhhCQ2VzJb8oPPFxDeF0gl1cJ5ScmkxW+a
         1c1uknbuWadHMYp5MQAKWv0FGQWNkpUP6UxY1YWBo5ePMZTx9UlMkw2KGmiQBk1y0hkr
         vU6+eLMAO8v/u0Cy28j7DsfChfDvtVBBB3G5xlDYE2gPJzyJ0YeJOZ4Ptm3/i5tGnNxm
         2DgmEERS4LsrKkkbwaqjAPCg1T2msNIXka3LbwFLPw7tqbTDUvlaeJbhdIfRaYroUT2O
         ub7V7TKzN/5+O1ATnb3364vLp6qbXEtE1L8dAHyYVUepG0GTEwQgae0wtK8+QMAh0QBb
         PQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rXYQao7eqgpJ8yFCJfVW72NnGbdt1aa3bK5h76VLyPc=;
        b=WlYBQ/492LWbVblGx/7A2rSURT27dd1IzQNptiH+8kmN0t6X/6xP1IDuJ/MLPLfub5
         k/EiQM1xhl/mNq/CQmB8ra0Qulf4iy+UxloO6QlsEooXd9L41If0W+klVyczaagbY+Tw
         IhEv3gcNP1wFGNr0DI/6fA/qhAelKIZs65WJXVi5C3MGAdVlTbzmuZ4/WOd2BiioRmhx
         kvQRvOBuL9ueFr50XoO487s2VAXUvo6BNmmVbVtAQzWkgJpOOExf9NdXKNYXg/HN3375
         to8Jhe72rLHQUNjAkH4P6C+Z804gPXhns9A47r+4tG98FHwB7M5NXS4ITX1k4juH7lVw
         84Zg==
X-Gm-Message-State: ACrzQf3NNjF2T97/uRrMxkhcqeVO0ik2OMTzoCwd7/8mbD5IbFpH17Y2
	Eko9E52p2FNWzX7Vr+YhFJi5YVeaGLM7ND16w6MoWg==
X-Google-Smtp-Source: AMsMyM5W+/XmtiDTx1m3Iy367sWIO5+tA6oZoxV4Ol7g63s47Tlovfe2fZ1LsPJfm+ALQ7IuFsgY8Lw5p6GeCER5a3w=
X-Received: by 2002:a67:c891:0:b0:398:a7ff:e0f0 with SMTP id
 v17-20020a67c891000000b00398a7ffe0f0mr903256vsk.22.1663841379479; Thu, 22 Sep
 2022 03:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220922083610.235936-1-xu.panda@zte.com.cn>
In-Reply-To: <20220922083610.235936-1-xu.panda@zte.com.cn>
From: David Gow <davidgow@google.com>
Date: Thu, 22 Sep 2022 18:09:28 +0800
Message-ID: <CABVgOSkjmuWDVwOW5PQRAtDYJGjHjcc_8Gg4JjhiT41Kez1rcw@mail.gmail.com>
Subject: Re: [PATCH linux-next] kunit: tool: use absolute path for wget
To: cgel.zte@gmail.com
Cc: Brendan Higgins <brendan.higgins@linux.dev>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, Shuah Khan <skhan@linuxfoundation.org>, 
	Daniel Latypov <dlatypov@google.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xu Panda <xu.panda@zte.com.cn>, 
	Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_030941_709910_DA051AB2 
X-CRM114-Status: GOOD (  27.00  )
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

On Thu, Sep 22, 2022 at 4:36 PM <cgel.zte@gmail.com> wrote:
>
> From: Xu Panda <xu.panda@zte.com.cn>
>
> Not using absolute path when invoking wget can lead to serious
> security issues.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> ---

This seems mostly okay to me -- we'd be abandoning people who have
wget in an unusual location, but I don't think there are many people
who want to run KUnit under RISC-V, have wget in a non-standard
location, and can't acquire the bios file themselves.

So this is:
Reviewed-by: David Gow <davidgow@google.com>

However, would a patch like this make _more_ sense? It looks like (at
least on Debian and Arch), the OpenSBI bios is installed as part of
the appropriate qemu package anyway, into a standard location.
---
diff --git a/tools/testing/kunit/qemu_configs/riscv.py
b/tools/testing/kunit/qemu_configs/riscv.py
index 6207be146d26..12a1d525978a 100644
--- a/tools/testing/kunit/qemu_configs/riscv.py
+++ b/tools/testing/kunit/qemu_configs/riscv.py
@@ -3,17 +3,13 @@ import os
import os.path
import sys

-GITHUB_OPENSBI_URL =
'https://github.com/qemu/qemu/raw/master/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin'
-OPENSBI_FILE = os.path.basename(GITHUB_OPENSBI_URL)
+OPENSBI_FILE = 'opensbi-riscv64-generic-fw_dynamic.bin'
+OPENSBI_PATH = '/usr/share/qemu/' + OPENSBI_FILE

-if not os.path.isfile(OPENSBI_FILE):
-       print('\n\nOpenSBI file is not in the current working directory.\n'
-             'Would you like me to download it for you from:\n' +
GITHUB_OPENSBI_URL + ' ?\n')
-       response = input('yes/[no]: ')
-       if response.strip() == 'yes':
-               os.system('wget ' + GITHUB_OPENSBI_URL)
-       else:
-               sys.exit()
+if not os.path.isfile(OPENSBI_PATH):
+       print('\n\nOpenSBI bios was not found in "' + OPENSBI_PATH + '".\n'
+             'Please ensure that qemu-system-riscv is installed, or
edit the path in "qemu_configs/riscv.py"\n')
+       sys.exit()

QEMU_ARCH = QemuArchParams(linux_arch='riscv',
                          kconfig='''
@@ -29,4 +25,4 @@ CONFIG_SERIAL_EARLYCON_RISCV_SBI=y''',
                          extra_qemu_params=[
                                          '-machine', 'virt',
                                          '-cpu', 'rv64',
-                                          '-bios',
'opensbi-riscv64-generic-fw_dynamic.bin'])
+                                          '-bios', OPENSBI_PATH])
---

That way, we could avoid using wget at all. (I did confirm that this
is the only use of it anywhere in kunit_tool.)

The other options would be to use some python library to download it?

Thoughts?
-- David

>  tools/testing/kunit/qemu_configs/riscv.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/kunit/qemu_configs/riscv.py b/tools/testing/kunit/qemu_configs/riscv.py
> index 6207be146d26..c3dcd654ca15 100644
> --- a/tools/testing/kunit/qemu_configs/riscv.py
> +++ b/tools/testing/kunit/qemu_configs/riscv.py
> @@ -11,7 +11,7 @@ if not os.path.isfile(OPENSBI_FILE):
>               'Would you like me to download it for you from:\n' + GITHUB_OPENSBI_URL + ' ?\n')
>         response = input('yes/[no]: ')
>         if response.strip() == 'yes':
> -               os.system('wget ' + GITHUB_OPENSBI_URL)
> +               os.system('/usr/bin/wget ' + GITHUB_OPENSBI_URL)
>         else:
>                 sys.exit()
>
> --
> 2.15.2
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20220922083610.235936-1-xu.panda%40zte.com.cn.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
