Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E63BEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEbEJ2g0faSxAK7+FnTEXgAFzKzUL2CyV1nGJ76Z6nk=; b=CNjJqPoOuvxYjh
	lzk9Hw34k3JKN2XrtiD9nYgo/sSwSABILgboejn7Of3+yscxxRXGlufbGA1SU57oRkBh4xEbsWgYe
	i9uRCdtEjCIYNe/4sNNZnZGSjKXRXViUv5HL8sOYsOWGfyzwI/hKLkPZbf7sRxAnLGg539JEwuEtz
	fv1NyDdyszZXYCYA9gdb/9USlMUBe7bqar5vmVCUgsZqAPvjQ7v6HZrRVdoMe197BC5d9rkEUrHZt
	GZPYvMJjaIPEhB7DlAVitBphRTGvzGLm1vAYyS7ZUc9GWpvCoCMN9Y/VaOFtJayn4foOPNHDVbbNU
	OIelq9twXA3D96s1XdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtlG-00Ejja-2e;
	Fri, 21 Jul 2023 17:17:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtlC-00Ejha-17
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 17:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689959863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQftevPX0XUeLPrBO0NAWxPIrge3Hp6/1+H4UC+Ikhg=;
	b=jOullois1qXlg5Og+Hk4Cxtese+TCHcC8rw2CeBbTUYPjQg7FTnFa6SP0p+5V8JrHXT/da
	mdFJ8HQdnvBlcY9viQASyeBegU5sASkpq5ANhGB4LihO0dE487hh3CGC6sPdmnpAAuSMU7
	inuj12KMvP2UdGF5aE1s2CTQsTtq9hk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-5CHMLvSCOGuARmDWDtOXgQ-1; Fri, 21 Jul 2023 13:17:42 -0400
X-MC-Unique: 5CHMLvSCOGuARmDWDtOXgQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51e10990adfso1349921a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 10:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689959861; x=1690564661;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQftevPX0XUeLPrBO0NAWxPIrge3Hp6/1+H4UC+Ikhg=;
        b=ZKTrPQAjT7oGtOkUXBR3XJGWL3nmCqtXYAR/fl5jx6mjtX1GSsFaVf5IVTOK1AY/N2
         QLG4bMWlj/udDo/lz72jLyYvvREagK2GrlLHHJ0ugREGAeB4uzpRhtUKERT7LYqpo9ZY
         SbGqfu5NYpSJNZzxJ6lBJS3qyMfSGPqlT+MT6mOL1Szj8ixzvJUXgKfq0x5wAe7G43Jg
         KIsSitcr8qpFyEDk8DPFPN+TkKz0yjFtM/O4ONXtGAPzxVSiY5QlV2NT0/HGW9IdQGsY
         S4QpZ+rx/5imXZui7u90UuATYT9VBHnu+sDNrR8g6R8KhNft52IeyS2GcahmprrUawuI
         nIJQ==
X-Gm-Message-State: ABy/qLYOtY80rw+2IK88NqW0OqZFtuqxJyW7uV6zmu2/p8JK8Tn37Kg7
	LUrEOle9385u9L9AwnUpz550EdmdL/V8k8SYlZ87xpYFhaJ00UKMQczTrxGOABXSfpwbN8BVdPx
	cFFAvm/4HiSC95m1sly9kskGaMF2m42J/seiV
X-Received: by 2002:aa7:c753:0:b0:51e:1a51:d414 with SMTP id c19-20020aa7c753000000b0051e1a51d414mr1878181eds.32.1689959861039;
        Fri, 21 Jul 2023 10:17:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFyyf9U2FFYwtGg7Nfx7TqscSvBa0fBBUyOLoWSpgQImoylEzXmYhbWs/84TcbA6dVob4NtSg==
X-Received: by 2002:aa7:c753:0:b0:51e:1a51:d414 with SMTP id c19-20020aa7c753000000b0051e1a51d414mr1878159eds.32.1689959860744;
        Fri, 21 Jul 2023 10:17:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id l9-20020aa7c309000000b0051d87e72159sm2346640edq.13.2023.07.21.10.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 10:17:40 -0700 (PDT)
Message-ID: <8ad7a846-64e9-a3f1-4bf1-731a994d62cb@redhat.com>
Date: Fri, 21 Jul 2023 19:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_101746_470079_80736A75 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/19/23 01:44, Sean Christopherson wrote:
> +	inode = alloc_anon_inode(mnt->mnt_sb);
> +	if (IS_ERR(inode))
> +		return PTR_ERR(inode);
> +
> +	err = security_inode_init_security_anon(inode, &qname, NULL);
> +	if (err)
> +		goto err_inode;
> +

I don't understand the need to have a separate filesystem.  If it is to 
fully setup the inode before it's given a struct file, why not just 
export anon_inode_make_secure_inode instead of 
security_inode_init_security_anon?

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
