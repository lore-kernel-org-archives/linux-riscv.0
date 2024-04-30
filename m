Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EA2C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 00:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ564N4AvaI/z6l39eP2/ij8zWbJwq8SCoZCS118kzw=; b=OMaiysdks4oLA1
	r2YQVJubWwBxUKvrldZqGo53cLqERqNC4cBwtRsKuXY73fExNnY7cOnFZU4t42weDWyzy/lRWIHdg
	GNFuhC7LpzdQg44O14MHIsT/Hzk96QB2mS/uqyh9SYsN0HPG18GDz+C/qGc2w2Db9BbyeB1X7TJA/
	oFFWWOvsQ8j6PVDKWg87W17epdTh8VW2ji+gD4WKwlVaWxtVrA97CqjCw5Ty/N2iwgiG1XIMD8bh0
	erfoPgoD0f1+3OuUYiGsedtkt/LKjnu+GtVysf4tGpuJvI6Lu9NsE/tWiCnoAoVwvnyaXVrZX2CMr
	RX7cuJlJ3p0CeOwl4zVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1axT-00000004WZG-0QA8;
	Tue, 30 Apr 2024 00:02:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1axP-00000004WYN-3O7W
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 00:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714435367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWZkiX6zsf6w2HczntfinTak8uCIlY7jOU3B2wGIYng=;
	b=TjDr+g3y1n6Mi+ge+/H9EqakwOWz/d1b9ar5SVQRCCCYm99YAk7fDeV6R2Ta4SQElOPe4I
	6cZC4YxkQnpJTpJXLpZGW4LHQjZwamB67SK9zoSAHXO0GUo2C8zMFnbocfplbNswxsCqVc
	VGcYaUkkGprAhLaUJfWsQCLKaLoUSeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-mTijwM27N-6Yt7PBHQTwog-1; Mon, 29 Apr 2024 20:02:43 -0400
X-MC-Unique: mTijwM27N-6Yt7PBHQTwog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7463F834FB4;
	Tue, 30 Apr 2024 00:02:43 +0000 (UTC)
Received: from localhost (unknown [10.72.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D32940C6CC1;
	Tue, 30 Apr 2024 00:02:40 +0000 (UTC)
Date: Tue, 30 Apr 2024 08:02:37 +0800
From: Baoquan He <bhe@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: stable@vger.kernel.org, Chen Jiahao <chenjiahao16@huawei.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Revert "riscv: kdump: fix crashkernel reserving problem
 on RISC-V"
Message-ID: <ZjA1Hbik7NiTkZOw@MiWiFi-R3L-srv>
References: <20240416085647.14376-1-xingmingzheng@iscas.ac.cn>
 <2024041927-remedial-choking-c548@gregkh>
 <3d6784be-f6ba-48eb-ae0e-b8a20fe90f58@iscas.ac.cn>
 <2024041939-isotope-client-3d75@gregkh>
 <a5493f44-2aac-4005-992b-f2ac90cd1835@iscas.ac.cn>
 <2024042318-muppet-snippet-617c@gregkh>
 <5d49f626-a66f-4969-a03f-fcf83e2d2bab@iscas.ac.cn>
 <2024042944-wriggle-countable-627c@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024042944-wriggle-countable-627c@gregkh>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_170252_061619_1979D063 
X-CRM114-Status: GOOD (  41.21  )
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

On 04/29/24 at 12:52pm, Greg Kroah-Hartman wrote:
> On Wed, Apr 24, 2024 at 11:40:16AM +0800, Mingzheng Xing wrote:
> > On 4/23/24 21:12, Greg Kroah-Hartman wrote:
> > > On Fri, Apr 19, 2024 at 10:55:44PM +0800, Mingzheng Xing wrote:
> > >> On 4/19/24 21:58, Greg Kroah-Hartman wrote:
> > >>> On Fri, Apr 19, 2024 at 08:26:07PM +0800, Mingzheng Xing wrote:
> > >>>> On 4/19/24 18:44, Greg Kroah-Hartman wrote:
> > >>>>> On Tue, Apr 16, 2024 at 04:56:47PM +0800, Mingzheng Xing wrote:
> > >>>>>> This reverts commit 1d6cd2146c2b58bc91266db1d5d6a5f9632e14c0 which has been
> > >>>>>> merged into the mainline commit 39365395046f ("riscv: kdump: use generic
> > >>>>>> interface to simplify crashkernel reservation"), but the latter's series of
> > >>>>>> patches are not included in the 6.6 branch.
> > >>>>>>
> > >>>>>> This will result in the loss of Crash kernel data in /proc/iomem, and kdump
> > >>>>>> loading the kernel will also cause an error:
> > >>>>>>
> > >>>>>> ```
> > >>>>>> Memory for crashkernel is not reserved
> > >>>>>> Please reserve memory by passing"crashkernel=Y@X" parameter to kernel
> > >>>>>> Then try to loading kdump kernel
> > >>>>>> ```
> > >>>>>>
> > >>>>>> After revert this patch, verify that it works properly on QEMU riscv.
> > >>>>>>
> > >>>>>> Link: https://lore.kernel.org/linux-riscv/ZSiQRDGLZk7lpakE@MiWiFi-R3L-srv
> > >>>>>> Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
> > >>>>>> ---
> > >>>>>
> > >>>>> I do not understand, what branch is this for?  Why have you not cc:ed
> > >>>>> any of the original developers here?  Why does Linus's tree not have the
> > >>>>> same problem?  And the first sentence above does not make much sense as
> > >>>>> a 6.6 change is merged into 6.7?
> > >>>>
> > >>>> Sorry, I'll try to explain it more clearly.
> > >>>>
> > >>>> This commit 1d6cd2146c2b ("riscv: kdump: fix crashkernel reserving problem
> > >>>> on RISC-V") should not have existed because this patch has been merged into
> > >>>> another larger patch [1]. Here is that complete series:
> > >>>
> > >>> What "larger patch"?  It is in Linus's tree, so it's not part of
> > >>> something different, right?  I'm confused.
> > >>>
> > >>
> > >> Hi, Greg
> > >>
> > >> The email Cc:ed to author Chen Jiahao was bounced by the system, so maybe
> > >> we can wait for Baoquan He to confirm.
> > >>
> > >> This is indeed a bit confusing. The Fixes: tag in 1d6cd2146c2b58 is a false
> > >> reference. If I understand correctly, this is similar to the following
> > >> scenario:
> > >>
> > >> A Fixes B, B doesn't go into linus mainline. C contains A, C goes into linus
> > >> mainline 6.7, and C has more reconstruction code. but A goes into 6.6, so
> > >> it doesn't make sense for A to be in the mainline, and there's no C in 6.6
> > >> but there's an A, thus resulting in an incomplete code that creates an error.
> > >>
> > >> The link I quoted [1] shows that Baoquan had expressed an opinion on this
> > >> at the time.
> > >>
> > >> Link: https://lore.kernel.org/linux-riscv/ZSiQRDGLZk7lpakE@MiWiFi-R3L-srv [1]
> > > 
> > > I'm sorry, but I still do not understand what I need to do here for a
> > > stable branch.  Do I need to apply something?  Revert something?
> > > Something else?
> > 
> > Hi, Greg
> > 
> > I saw Baoquan's reply in thread[1], thanks Baoquan for confirming.
> > 
> > So I think the right thing to do would be just to REVERT the commit
> > 1d6cd2146c2b ("riscv: kdump: fix crashkernel reserving problem on RISC-V")
> > in the 6.6.y branch, which is exactly the patch I submitted. If I need to
> > make changes to my commit message, feel free to let me know and I'll post
> > the second version.
> > 
> > Link: https://lore.kernel.org/stable/ZihbAYMOI4ylazpt@MiWiFi-R3L-srv [1]
> 
> Can someone just send me a patch series showing EXACTLY what needs to be
> done here, as I am _still_ confused.

I think Mingzheng's patch is good to apply in the 6.6.y stable branch.

Hi Mingzheng,

Can you resend this patch to Greg and stable@vger.kernel.org and CC me?
I would like to Ack your patch, but can't find the original patch since
you didn't cc me.

Thanks
Baoquan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
