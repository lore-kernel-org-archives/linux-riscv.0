Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A49C5DF70
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+01sGRp9D2eAlG4d1iYaCELHrRLFzm5xv/uvg0/+QE=; b=OyFgd7ZEB+u6A/
	ZnrlkmlSJLz0sai6AyOVUiub/aindGHsbM93/Zv+zajp90e5kQ7UAuOZ8lQDpzN6a/BCevxCmBxAY
	LFHn7wac+OyXw8gwHsRocyVzaLFLZC9Lhs7V5UNSTON28hR6BlgJD3Nxt88HikxSTNQfIKkBQoip/
	lWyHbGJNEynOjhCp4/0/KlJKQsEP0K84HProRNaiOwKywJAAio+oUc07UkvXkxk4uQ5q24J8sEGoY
	Dm+kFbvvtDPBzpgMT7brVbN52PYVFRVzi36E1BU/iJ1GBtG3jd0728nsq/rfK8KWTOVv+y7THksXg
	enfcWAVfVtXEV8CL1kyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEGq-00000007SSw-3XqR;
	Tue, 18 Aug 2026 07:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEGp-00000007SSZ-2MoG
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Aug 2026 07:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+x8pfgxpAdfeffVvBTclc7h7taQeubCUNT1m9PIdpe4=; b=j2dAP0l+2r86PMzM+rgHPf8Z6C
	jmqGtrGFyHAt7X1K7+8dIBLmcFP7s3IJZc+vCwnDbvrtzzYW8l8lwWoQj9Dfp3mfxKnfUrEBgtVyn
	dzmqkb/xNNQ99qGXM3G0ZnlxjRZZGSU2WVD9TmWFxdz3y+dqfXHsjOliwIBIBTbqY9mOaaYGdavxm
	Gh3HudUSPJoic8DwpdDSrIfREUhKTDgPGYLjWpjPdj9xFJCuNhGyxL8h5puyX7dh3q0arMMVVrOR1
	Og3EOyL0TeJc1Ux2wo/gLXhgFlTm99Tn7T8IOo6xlkSCj+rTKCfq59+eMotuOAMGXZIm1h7VEoqWJ
	MFxD0SyA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wwEGm-00000001QtM-1BRC
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 07:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787038188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+x8pfgxpAdfeffVvBTclc7h7taQeubCUNT1m9PIdpe4=;
	b=PoDwOmFJJWNR6TUhaCygvb2eJpC/5gfHmssg72RzvMCW7O6i2FhBVNlgZfc3HdyCu7HGSK
	tXiMuydM/gHKuPq/u5Mu7ABC1UO0fw+5qqRh5YVUTHo1V3eM++HmPXsxhdewthEA92pz7d
	Gh/HU0pgvjK6/HW/kQ7MmlktMD6a8P0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787038196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+x8pfgxpAdfeffVvBTclc7h7taQeubCUNT1m9PIdpe4=;
	b=CNhdJRsIf9pPl6/8JSNl9UHIbmf8eooCvI1GPBaf+3B6XgNdQm+KM1xyuqpZHyqoMKR5VI
	icgSn1NDJz3O5lgHRerOyfB/97Cr7hHFqsgnpRoh5Z4+nE8EfT82JdX8vVap61icVXMl0A
	tUUtqzgxewOFRKsCyYaNDGgdumACXNA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-x644BuzUObC3_jznpDetjw-1; Tue,
 18 Aug 2026 03:29:42 -0400
X-MC-Unique: x644BuzUObC3_jznpDetjw-1
X-Mimecast-MFC-AGG-ID: x644BuzUObC3_jznpDetjw_1787038179
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 26812180034C;
	Tue, 18 Aug 2026 07:29:37 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7315180034C;
	Tue, 18 Aug 2026 07:29:28 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Peter Bergner <bergner@oss.tenstorrent.com>
Cc: Andy Chiu <tchiu@tenstorrent.com>,  Jonathan Corbet <corbet@lwn.net>,
  Shuah Khan <skhan@linuxfoundation.org>,  Paul Walmsley <pjw@kernel.org>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Alexandre Ghiti <alex@ghiti.fr>,  linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org,  kito.cheng@sifive.com,
  dfustini@oss.tenstorrent.com,  greentime.hu@sifive.com,  Andrew Jones
 <andrew.jones@oss.qualcomm.com>,  Nutty Liu <nutty.liu@hotmail.com>,
  Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,  Yao Zihong
 <zihong.plct@isrc.iscas.ac.cn>,  Xu Lu <luxu.kernel@bytedance.com>,
  Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,  Jingwei Wang
 <wangjingwei@iscas.ac.cn>,  Zong Li <zong.li@sifive.com>,  Deepak Gupta
 <debug@rivosinc.com>,  =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>,
  linux-api@vger.kernel.org,  Jeffrey Law <jeffrey.law@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] riscv: hwprobe: export the availability of vector
 to user
In-Reply-To: <d889d09d-951e-4414-95bb-625bcab7af9b@oss.tenstorrent.com> (Peter
	Bergner's message of "Thu, 6 Aug 2026 12:09:00 -0500")
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
	<20260723222109.2229089-2-tchiu@tenstorrent.com>
	<87bjbwk0q5.fsf@oldenburg.str.redhat.com>
	<cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com>
	<lhuik5n4v57.fsf@oldenburg.str.redhat.com>
	<d889d09d-951e-4414-95bb-625bcab7af9b@oss.tenstorrent.com>
Date: Tue, 18 Aug 2026 09:29:26 +0200
Message-ID: <lhuzeyjanu1.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: CMmDCeOon7pL6ROd5GBTjJ3I4qPE8JzUXTXNnZ_O7ck_1787038179
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_083000_555011_BA292736 
X-CRM114-Status: GOOD (  16.46  )
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

* Peter Bergner:

> On 8/6/26 1:31 AM, Florian Weimer wrote:
>> 
>> And if RISCV_HWPROBE_KEY_IMA_EXT_0 comes back at -1, we'd turn on V
>> unconditionally?
>
> No.  The unknown key (RISCV_HWPROBE_KEY_IMA_EXT_0 in this case) field would
> be reset to -1, but the value field (which is what we test for the presence
> of V and other extensions in the resolver) is set to 0, so we would not enable
> any ifuncs in that case.

I assumed, but didn't write, that there would be a separate probe for
the V extension.

> For kernels that know about RISCV_HWPROBE_KEY_IMA_EXT_0, but not the
> new key RISCV_HWPROBE_KEY_EXT_ENABLED, the key field holding
> RISCV_HWPROBE_KEY_EXT_ENABLED will be reset to -1 and its value field
> set to 0, while the value field associated with
> RISCV_HWPROBE_KEY_IMA_EXT_0 will be set to the "extension is present"
> value.  This still suffers from the (already existing) we'll enable V
> ifuncs issue you mentioned if prctl was used to disable V, but as you
> say, it will be fixed with a kernel upgrade.

Okay, that's fair.  I'm happy if there's no difficult-to-test prctl path
that we need to maintain indefinitely.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
