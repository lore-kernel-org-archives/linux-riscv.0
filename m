Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A3BCD1288
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cju4MDfwwXdTpSoB1iYcdevzoG9Fal7klksIYjHaEnk=; b=CdIQZm9rkl+skE
	x2Nx/YG10y3HNAQu3uAuwNOmOrlMgKN6Fp9U3fLw+gbF9IWeLSZH3mrRyTq8T/n8g4xse20cTd59A
	aoJcYLWIiroZ11brAkxK3F2MNJg+sjlQEG5fTv87+5LTOSvXd06OSakzFfAR4C5ETvVJbcN/i7UnX
	NFGDJhr4+qu4jKXk5OlRZuDT169CSk2s1TsDkwQVXv1ay4sUR30qc5AFLUgjQPazuaPuiOwAdFoc2
	Rm5aCrEQG3dZuW6EZL86TbMYki08jsnDiYoL7w5gy8xc4tR5IkxvEMDWBhR6JkW/Lm0C1iJ5nCLCD
	dWR/kw9MKow3H4+6G9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsAY-0000000EdE5-0o1w;
	Thu, 28 Mar 2024 15:59:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9r-0000000EcnJ-2tfp;
	Thu, 28 Mar 2024 15:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=p3AvYdKmdxxqju+5SPT80mvLNGtgKBQYlP0ueoSRpS4=; b=SNurta+k5vmyYB2klemvjz3NRb
	V51dqluiUnAVQX3YM9zsAGjrLIrymmGzidXuu9SXViB5kYyasTX1cnIVOhGbJ06e+GOTh/CUsDIqi
	lby0b+UIrhKO+nXfWgfl4w/enYysGB/EoEqsMLXfGz4qAMruF2FJm1JQuQX2oPRKzdWpDkst2kNs9
	i9wITKmCJW8mNeB8N2cqu9VEhgoUN4ZcFIF0Pfw7RzODJxbZfBUWSKMpgfWL/cXt7vONX/6IO6qQF
	Cd0IHIMf/TFWsyRGpp7Njj9rIcxV3354ZolwNKxizq7J2DgBLXufgaST4oV9iz0O+NmEX5JyKX4I6
	4HH1mLaw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9k-000000012YD-17L0;
	Thu, 28 Mar 2024 15:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AD46617C3;
	Thu, 28 Mar 2024 15:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFF01C433A6;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641546;
	bh=AfrCwZ80UJ3Lm4rQSxOz8hzzAx1c2/4P6ahzY46bag0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QpwTzhmR7WGhuLwCx6UXbumllSSE9tYRsKkAr6OihSqnK/6Y+IWXbKQAHDInyuaWx
	 rTDfBmUgfZ98fOScbKZBeaOSEdLQo2wuZrLXIG8wi5b2tQIbL7/LhsLU36tC9m8QLm
	 SKFCwTJclUweEoeigZ8MYMjNltuD31nSRuDh9qMDHtnDayRxWSriEwama62/Ig779S
	 MQkoDfrzF5+8mxp4hKMzkI4AObyj9cvED1J0AMGty75Nvmg2Ic82YbCEIOO6h4wY/+
	 9M1eZBcXQCxM4vr8IdTZKoYYhGv3bb6tZISiHLdtG078zWhQIubeXRMxKYeoMix+OP
	 3/ySCP8cmwVWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD355CD1288;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Mar 2024 16:57:51 +0100
Subject: [PATCH 4/7] initrd: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Message-Id: <20240328-jag-sysctl_remset_misc-v1-4-47c1463b3af2@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
 io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-2d940
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=dgUaKeQvY6Yod09xLYXFtRCigrPjq/BXAkqZRZrGl5Y=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGYFk8XUCfilPNsCftny+5XBz8vuxkpLL6JS7
 SCj0hqJr2zVAokBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmBZPFAAoJELqXzVK3
 lkFPpf4L+wRgtVGVBHjTE3dn5OJC+qANHV6TvS+aBE93+XlWcxZos/8ML4JUmXrCqyDX+EjaEmt
 Bl1MIWQAVqLXLuV7NDHWaNzl/KaCn7lS4MToV9Ele72KR+KWBLrnjQ/I+5IQf/JDUlRkkrcBNbS
 552foz839UfCmsc3qOa6OcB6/xYB/gBK5DxflSgUd+Ziu6Ae7iaojNn+RGbv1ZDklEFh/f8/jpD
 UqCAWxXD2JyYCZsEEpmsCmkOQB8efRr99QTCROusfn8mUMush1Bxod1cPFXq4Fekw4ycYERCYdk
 T7vpnaafd/mbKKROVnW0INiF64qLruVon1sVyPP7Jz/t2QGRfmb6SFLwTjQweUjiOxn0HPXQchy
 EIundt+krY0mkCcBVyKC6gb5Uo5ccOPPvzY1kjXyAJhmVlp7vjnoX3aUdTxwrpov1YY2pPjzf8J
 YpUSnaTsAtN6NIWpJsNhma0X8Fa3853Wn+ZChtFx+TOxMj9f6Srzl8C2TOGe/baq643G4sE5nC6
 EY=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_155908_754900_282D3B62 
X-CRM114-Status: GOOD (  12.46  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which will
reduce the overall build time size of the kernel and run time memory
bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from kern_do_mounts_initrd_table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 init/do_mounts_initrd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 425f4bcf4b77..22c7f41ff642 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -29,7 +29,6 @@ static struct ctl_table kern_do_mounts_initrd_table[] = {
 		.mode           = 0644,
 		.proc_handler   = proc_dointvec,
 	},
-	{ }
 };
 
 static __init int kernel_do_mounts_initrd_sysctls_init(void)

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
