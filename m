Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD1DD35669
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 03:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQeIYEjWvWAhjX1kqHzdm9bgg27pG9HeHKgWQ6KGzwA=; b=PS871Ton6xcv4p
	nnBhw5n3D6K912Tc6QzT+NMznkvTwEVdYxnjTWqvnCgbym6y1BHzICFsqqQi/koW/dL7FtiEU5HVZ
	8OFeeQ+sAcso1amfd5d6kqWrsbzJPC6B5xm5oWtu4ou6jSONy1la0CctfZGiIC/l+LzG8I6grF9mb
	Ag7MxIcLOOJa4MmtguUR5CL9ENHfeAmajtgmvDzFcWFUvskovYo9ZDgu3B+ILADooSSpf7vMEH9P3
	rzc/SIk8niVytFoETzK8wTZHpextZYnKQdXvwLVyZySw59hy4sCTESselz4X7PpNwslzSO40wEQyV
	AnWH+RwSzaybluV/cA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkwPV-0000000FOEn-2L0C;
	Wed, 28 Jan 2026 03:40:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkwPT-0000000FODy-13CT
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 03:40:04 +0000
Received: from [192.168.0.109] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowADHcW0DhXlpfl6GBg--.10567S2;
	Wed, 28 Jan 2026 11:39:47 +0800 (CST)
Message-ID: <91bf33e2-4588-419f-aedc-1f1b4e99fc56@iscas.ac.cn>
Date: Wed, 28 Jan 2026 11:39:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] PCI/MSI: Check msi_addr_mask in
 msi_verify_entries()
To: Thomas Gleixner <tglx@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Creeley, Brett" <bcreeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
References: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
 <20260123-pci-msi-addr-mask-v3-2-9f9baa048524@iscas.ac.cn>
 <87jyx3be1t.ffs@tglx>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <87jyx3be1t.ffs@tglx>
X-CM-TRANSID: qwCowADHcW0DhXlpfl6GBg--.10567S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYk7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxG
	xcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_GF
	v_Wryl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_194003_671203_D397312E 
X-CRM114-Status: UNSURE (   4.55  )
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

Hi Thomas,

On 1/27/26 17:27, Thomas Gleixner wrote:
> [...]
>
> Other than those nits:
>
> Reviewed-by: Thomas Gleixner <tglx@kernel.org>

I will fix these and patch 1 as well in v4. Thanks for your review.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
