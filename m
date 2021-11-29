Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A04C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 17:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N74MVcmZ9YjZU544TmfzwSRZiNe43nak6WuNP5ME93Y=; b=0RjMhK6MAGKqfX
	FUOgC4tWqUHRyh8kQ6c7jxLNkcj4PntDhAR+8P+zkzOM87TZOvuoM94oHyfTh4k+/U+x/7kPdzLBK
	i2w77q7XjuMfuL5bikvvLLv5qY/EDeOPB9WNPLfFHeRiOnU6uC+lK1u52221eL61II01H+n50t9vb
	udh8CTGPyzn/GYc5qEOwFjNzjTuLkscQ/V4auuNqmUf6r38MDcGNqnV+urECm2jMJM2rNyp+CTACS
	SO1KbexU2RIdlW9qJuP7/8M2+2rx0NVZopAHotYYVM3LXHTlANuMjcqKkVUNgoBRODDm1XGk8LZkm
	lqErvalme+2WI+3N3XDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrksV-001fQA-CW; Mon, 29 Nov 2021 17:55:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrks8-001fHE-6q; Mon, 29 Nov 2021 17:55:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id r25so10137810edq.7;
 Mon, 29 Nov 2021 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jo8G3WIFnCXJv/Wl58UbY8LXKhGKq56nydp8ornyGvw=;
 b=AjLExKPDvZxJIAf93isJIQG5owoNwi20rpmLOoVH2+s0ZWunJFmYMjECqAXAa31ExM
 qP4APhy58+cgNzSgs7CZp9bi9ZLfh1Um4f0T4CPKtFMqEQtoIPcbCG5ECCW+4/RpN3qP
 1k3CIsFPt6dBLkWzV5yOedKG0phAVvwwuaHgAci5hCbOZz8Yy6GMFp/NPR+R+K6sin3x
 5VGYrAKTVs66DntrIpjFBpn/bDtGwX2tdoIaZvud6hNaP1K0MD3EhI9p5XlWWUFTNrfc
 xT0cVpHPnGNOA0p342OPsO0F8T5HlLM3fktULYfIDujE1Zx4qHlH1POPSzpbzwUrncLW
 GVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jo8G3WIFnCXJv/Wl58UbY8LXKhGKq56nydp8ornyGvw=;
 b=gFrIRkZ5Hm+uqutclhyQveYkDAWyWRPXtJjoYYxaUCaW40hcGtSDZ2aCUHSLivFqPv
 vZuosAJWfi0h6Co2TI+M1NdfCG4DrNlbxX/rZGPy7dpZnKSGRvR2rRHdtDS3QizgrgK/
 0rl/s+PGUFs8Wt32nThyIAdCjSHkNFAOYHamhZ1j0ZM89gK8s9bvN1HNf53cXTtkRjO/
 OnGxnfajgS2684JtvnYhW3tt9E8wgWEB8RuyrO0QZe+KScJ5z+qSAMY1mdRjR3uYpOu3
 tenZ+x3hRAdWFnX1N26DHPg5Ch3AH6cXF+1OrissgzGsjxC5ZVQ/FpPaOJzgcnViO0A6
 rjEA==
X-Gm-Message-State: AOAM533GSBIfOYfNkPuklEuyDhbjAEKIe2t0bkfY2+lVeuRNMN7DhFJf
 aBWzd8YSkKYPvMXTX4fdqXM=
X-Google-Smtp-Source: ABdhPJzV0Hp7Xr2kSqyy1FejCYUnhDh4xLCC02qQtKZ+cbHbGKkW71ueP1pw91X6C27D1KEW8+5Gvw==
X-Received: by 2002:a17:907:68e:: with SMTP id
 wn14mr62415481ejb.258.1638208522107; 
 Mon, 29 Nov 2021 09:55:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id og38sm7559529ejc.5.2021.11.29.09.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 09:55:21 -0800 (PST)
Message-ID: <ba8341d6-7ee7-1af1-1385-0a9226bbf952@redhat.com>
Date: Mon, 29 Nov 2021 18:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YaUNBfJh35WXMV0M@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_095524_286376_E3F62670 
X-CRM114-Status: GOOD (  11.17  )
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

On 11/29/21 18:25, Sean Christopherson wrote:
>> If I apply though only the patch series up to this patch, my fedora VM seems
>> to work fine, but my windows VM still locks up hard when I run 'LatencyTop'
>> in it, which doesn't happen without this patch.
> 
> Buy "run 'LatencyTop' in it", do you mean running something in the Windows guest?
> The only search results I can find for LatencyTop are Linux specific.

I think it's LatencyMon, https://www.resplendence.com/latencymon.

Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
