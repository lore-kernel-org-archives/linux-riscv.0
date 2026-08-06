Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B68C55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhQTa8bTOTvsgb/i95SFQZsroA7CPS6y0eXvTeqzZu8=; b=Dc+uXgknrHZcxe
	FIgNLPh6Vux7VagmPdPzj1u6Ea7I7B6Ci8NcNJwx4jUOJ+vh3DVyBCc+6TS2WnK5pmsdzGFa7AZ+O
	M9l+CwRFZZqjBam2ha+vt/kDbjNlBKoDaoYP+Fc4waicuFIE4THX9P4gsMTnjxp6xSPzq3tj/gkiz
	9I7V96/GeHQ0JfyE6JSlG9yTsj48SJc3LsZW2xpwOrgUtDvOCYR6pCI+AUhp6SsNitIilpPBy60c6
	tWhfiuujE0QZYhz2Z6l7vDHtB8+SQQ3xj+geBRxXtQ3jHGwNI2HxbK9tOiQD9eHaGoVvgu3HxJ90B
	wk3QxHYeWVLMaO9hmSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrreT-000000052tN-3le9;
	Thu, 06 Aug 2026 06:32:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrreS-000000052tD-3d4v
	for linux-riscv@bombadil.infradead.org;
	Thu, 06 Aug 2026 06:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4E5y/AkNbZJxw0IkAsjY/ZvET0ucQGZj9LI++HPuzv4=; b=pX1Qp6ZhOV2j+HkpHdwWC8oDiB
	JOzTcw+UGiryQoZXSoq0oVQVWYrl4geDmE4DlJhVfgKQdP4eUPhOQo8sgGsQghsg7VgRQuJh37dy9
	MOPBGEuMeAhg05nhcoymBI9SeDisBNCsO7P049Vju4XVESVqGmF32dPrV8voffDQ0mnlxSqbXCEYd
	mDwG0NLNxYBR92Y0kXu8V09Ec5J7N34eC3k2RWb5HAM7g/LGVpXDsK0Pcx0Vfy4ZfD53T+Qwl4E5p
	LtgRZHH/vmuoe+MebsODsNnmhoKkeW1cza2Rgcq9t5GQTl4RWtrZB7Gepr2XGSRPNagfJg4Ddjjlp
	JsF/4U/w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrreO-0000000BGPE-3UFf
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 06:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785997929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4E5y/AkNbZJxw0IkAsjY/ZvET0ucQGZj9LI++HPuzv4=;
	b=JYtmtNSHXWqNyrXS8KGcW39Sgt+eX/ST8IfZNkHzqNLUqOLIzc9ZHmptB0FA+8juSIK5qM
	9eqdN98Mm/Mb42w/vJDT7qlQAbAG8M2xLI0Qyk4c7jiprgBnCmIwMhqBLv/Hidt8sZYGnN
	T6r+j9UCbdpE5o6QZ2u2hNXIG3yQqUY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785997937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4E5y/AkNbZJxw0IkAsjY/ZvET0ucQGZj9LI++HPuzv4=;
	b=D9Ul8HJeJtT8FIDr6RAMlghr/kJLnduiECZe6wjNZ82s2B5ky7C/n/XW8OdwnV5M4awmm8
	vgutld4ikt/8lQiSd70nCECzXwuxq9Uf5g1oTuw223A/mR0pXfWx4x+ae711UIs5/IoRZ0
	CBrsPhfSwolgvft+YpDB3M6RH0QzH0I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-AReQfHRvOQSizv01XUWLeg-1; Thu,
 06 Aug 2026 02:32:05 -0400
X-MC-Unique: AReQfHRvOQSizv01XUWLeg-1
X-Mimecast-MFC-AGG-ID: AReQfHRvOQSizv01XUWLeg_1785997921
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44BEA18000A3;
	Thu,  6 Aug 2026 06:31:59 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E85001956049;
	Thu,  6 Aug 2026 06:31:50 +0000 (UTC)
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
Subject: Re: [EXT] Re: [PATCH 1/2] riscv: hwprobe: export the availability
 of vector to user
In-Reply-To: <cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com> (Peter
	Bergner's message of "Wed, 5 Aug 2026 13:40:27 -0500")
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
	<20260723222109.2229089-2-tchiu@tenstorrent.com>
	<87bjbwk0q5.fsf@oldenburg.str.redhat.com>
	<cc671848-f954-41bf-b7a9-ba34c29593ec@oss.tenstorrent.com>
Date: Thu, 06 Aug 2026 08:31:48 +0200
Message-ID: <lhuik5n4v57.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 28zduI8tfE3yEJQJTASdkJkh2gAC8AqLp9gGNhRwY9E_1785997921
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073221_091273_D323D173 
X-CRM114-Status: GOOD (  11.26  )
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

>> We only get a true userspace simplification over hwprobe + prctl if we
>> can disable vector extension usage if the kernel does not support
>> RISCV_HWPROBE_KEY_EXT_ENABLED (so a V usage regression for older
>> kernels).  Otherwise we'd have to use the new approach and, as a
>> fallback, the old combination of hwprobe and prctl.
>
> Since the kernel ignores unknown keys, we do get a userspace simplification
> over hwprobe + prctl.  The plan is for our GLIBC IFUNC resolvers to just have
> one hwprobe call (as they do now) with RISCV_HWPROBE_KEY_EXT_ENABLED as the
> first key and RISCV_HWPROBE_KEY_IMA_EXT_0 as the second key.

And if RISCV_HWPROBE_KEY_IMA_EXT_0 comes back at -1, we'd turn on V
unconditionally?  That still leaves the existing bug on old kernels, but
at least the bug goes away with a kernel upgrade.  This isn't too bad.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
