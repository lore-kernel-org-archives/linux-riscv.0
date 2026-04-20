Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B27F557EC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgeeF5Ui84/Q63mj5ixzaQLWLfL8nkOyUzgrGazF90Q=; b=kyAgc7betrLExg
	MqhI1IT65fHwTcs/fQb7zrIPJR3tC2LJYjlVC/b0HqYEFqFhj1wVuZ7A10qfFhElx6QunP5bfJQJr
	+R1vO/XOWBgm55sq13K1EBNXUdvDjxdwfGNw4gGGuF0jo+kw9LYBlL29demabjBaDiLRlWvhkX7UQ
	0Jv54u+vRq2yayOb0PQNEOBDgh/ajsNvd/dR/HjGUdgqSoaTJPbQjehavvtJuuLOiP/teHiHpWN94
	kL+i+0dhJL2TMQkUcdIOX7djU0wLWmyN83+omYyWKvsHCSTPjbGUry2JGDrU9fJZsZrkAAYWnO2Qw
	wcS2ozcDErPNIIzqRw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkMY-00000006ddR-3lyV;
	Mon, 20 Apr 2026 08:52:14 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkMV-00000006da1-2NgM
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 08:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776675043;
	bh=C4jv8AOEenPNqk8kCRU3fmuZmBCuqPIJLIR0ZnoQbxk=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=kmgltNryPH2EcMoKQ1ov3iSfViD1QRzju7QKAkCtWcWXgViY/UY24FJQkHEgAUUTI
	 sbYCp7JzElHODOdiAa/nhA+f+IcB/C9XojHwYX+AnGkzQxmMaFaVv8bp/JcgJli3bw
	 XdwJmRmv7RGcZJ1h6KeN5pDNBkq0896U2gh0A4v0=
X-QQ-mid: zesmtpsz5t1776675034t1622a38d
X-QQ-Originating-IP: LdwsEwNEVx4F6gK4cwZWkEzkl1ZW7RzpwvQJevbqrVw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Apr 2026 16:50:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8737092241665561368
EX-QQ-RecipientCnt: 16
Mime-Version: 1.0
Date: Mon, 20 Apr 2026 16:50:31 +0800
Message-Id: <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sandie Cao"
 <sandie.cao@deepcomputing.io>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "kernel test
 robot" <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
In-Reply-To: <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M2zqjw9HmwecIyxwiJncrxe2GZ5D5OoetO8da6fK6HkKrJyczzr1/XUQ
	/0vi2IyPPnZUqEmS6KAWpgOvzR/fmYdf6a5F6qNps/Pexjn6SU8/ZKeHpo84Jqj0/qnvXwd
	/XRAKU5QIg4eD+e25AyWsxnSYpP2xKcZYLUZLbdkmDm+mPEj2VDNo/rWdGJoRyS3vy/gXCi
	STsluhU6F0ZtkMKjtJN4j55GYHH0TCDr0UTg0XpGRwlMk1FTVIVD8W1kJ1DrHNTYC47XD1i
	3B6Q/pk6BwW14e8jZPsNfMIDvCPa5Ai6+iyTW6q5uQBY+ysjgn7NoZFnLbZY7U9+YDVUcRV
	7p3MLy9rCo1nZ1xIUCUncA0ZC3ZOZVm+Ve4MLB8eaTunZ1Bl8aORtbZVyNvoqZ/NUfC16k0
	V/dIH4osdX5oRrY7O0nfBTDSrCRCZYjN4gXSftZSjyzgmQ5TFBfLdLmu7zJG+ZRuR0LIcze
	zOTrasQDJgsmhiy1sgNMtkeOw+6SJ+aLsMkQpK6pwjcAHCRkoHRu+c8++An0rXAvhrKLbxi
	+WxuqoECofm4/7SqIO6q8UIuLfiWufwUyEtV+BrJruL09gAbM/VR1PPtC2dihhhMYcxnoG3
	K99D16zFSI3qLGOeqH7LRznRGGRlvCIugIzT7W+cdi1s074jRzQywULwSu0KizXnwSKcE6/
	7qcrxzgVxZ3ZfbwRtjhT2Ya5j6pyZMo0TVDnMH2q6gRJJrmSITY1WvbydZ/gQ4qP9yL0Bn7
	UDu7N/iKLi9KkGuOp5keQ7ONmmaIlrXzJgrGIALd0EwpZ1aJJPJmkT+f7xqz26ZjrggzqK5
	6byh2s6DMOrK8HDoWOz19oyr3iBe0fyqDFF/iCP2N7oB0QToWl7o6OBkznPEj+Uj15CVO5p
	ZWAXq02jf5H1JHr2avPyn1ceuj4owy7WKXiURJfzwsgLmu3bZE4pnZ41hgyzatxYsvIIjqo
	uIpaRdwlZglNPg92nxt7tSZlQw2l4ctReVC5LuJMzUnyixpYHXTL+r0DPBO3oz5D+Eb3ckL
	bKIEqpguUAadT/yPYRvPVdG2suJ8q+zJXS7E2pYPIk9DTWnw0ZGzSJEIOzL+6DRx26SVxP/
	9Kx1kQU55yu
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_015212_809143_8AC8A950 
X-CRM114-Status: UNSURE (   5.17  )
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

On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
> On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
>> On 20/04/2026 10:39, Sandie Cao wrote:
>>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
>> 
>> Missing space after main commit msg.
>> 
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/
>>>
>
> Also, the file reported in above warning DOES NOT EXIST (I checked
> next-20260414).
In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:

properties:
  compatible:
    enum:
      - spacemit,k1-pinctrl
      - spacemit,k3-pinctrl

So there's no reason to use k1-i2c. As far as I can tell, while they are the same IP,
there are subtle differences between them.

                                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
