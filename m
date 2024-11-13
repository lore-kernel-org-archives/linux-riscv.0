Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEA5D597DC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 03:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haXduAmTKu5D1O4NNYIacyGfig+hR+VjnqLMCk/hEX0=; b=wlU/lOYHDdwTfy
	zYmYySpPYbnDl1LMfdBjadH31lwCgVp0eOhlu+ndlknhjU3hZLA8vvkgW1P1CHIwHmRI5KGvLqtH7
	BuC+tG47QKqW7MM5k+YB2H+8p7ntGwaop4SSi8y0gWSzsNcoW+QnaeAbm2P3/ZOX2VDrMxauvzYBL
	CivgHh4zAUG6t4imWpMizCwGYNsgTPYmn9dANO/fZJQqf6EuoRSYTFmtoLZ/nF+CoYSpVlXlH48jC
	QNhX/OqwY1VrjJ06JPnA9puV4Ml4LB7QoecaYtTgqp+DmtDkcG2cAG0CV4CQyQYvkIBEW4zqRtd7i
	OnxuN0Jpp6YlMamOYP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB46g-00000005gKl-2A8F;
	Wed, 13 Nov 2024 03:31:50 +0000
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB46c-00000005gJ4-0OL9;
	Wed, 13 Nov 2024 03:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731468706; x=1763004706;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=/bYsay7vg1weqenJRpb4pqt79mASw+nrIHAtGk1mYk0=;
  b=mnBzi8B9oy31eLopsrxtZmIHq9iJtOCCCELeNdLnfDo7y4PF1SZ1tfM0
   RBjUW3t+0nkBWZOilwc9CU+vwNI0Yb6dQL3dy1WXkBVhS7rU1jgibqXor
   v4jDlDSoEvH1mPy6HOTf5YgttHZ1P0R1sKjshinchXoKRM2IwMp6CxiQY
   E=;
X-IronPort-AV: E=Sophos;i="6.12,149,1728950400"; 
   d="scan'208";a="442195777"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:31:38 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:35392]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.112:2525] with esmtp (Farcaster)
 id 1975e212-552a-4756-aa4f-791440302fe9; Wed, 13 Nov 2024 03:31:37 +0000 (UTC)
X-Farcaster-Flow-ID: 1975e212-552a-4756-aa4f-791440302fe9
Received: from EX19D003UWC002.ant.amazon.com (10.13.138.169) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 13 Nov 2024 03:31:37 +0000
Received: from [192.168.205.1] (10.106.101.35) by
 EX19D003UWC002.ant.amazon.com (10.13.138.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 13 Nov 2024 03:31:34 +0000
Message-ID: <96c24397-b081-4570-adb2-8d4443f3359c@amazon.com>
Date: Tue, 12 Nov 2024 20:31:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <elena.reshetova@intel.com>
References: <DM8PR11MB57505F62D149EF153F89B8BAE75D2@DM8PR11MB5750.namprd11.prod.outlook.com>
Subject: RE: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Content-Language: en-US
From: "Manwaring, Derek" <derekmn@amazon.com>
In-Reply-To: <DM8PR11MB57505F62D149EF153F89B8BAE75D2@DM8PR11MB5750.namprd11.prod.outlook.com>
X-Originating-IP: [10.106.101.35]
X-ClientProxiedBy: EX19D038UWB003.ant.amazon.com (10.13.139.157) To
 EX19D003UWC002.ant.amazon.com (10.13.138.169)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_193146_392339_614365FC 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: jthoughton@google.com, canellac@amazon.at, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, dave.hansen@intel.com, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, mlipp@amazon.at, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, seanjc@google.com, derekmn@amazon.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-11-08 at 10:36, Elena Reshetova wrote:
> On 2024-11-06 at 17:04, Derek Manwaring wrote:
> > On 2024-11-04 at 08:33+0000, Elena Reshetova wrote:
> > > This statement *is* for integrity section. We have a separate TDX guidance
> > > on side-channels (including speculative) [3] and some speculative attacks
> > > that affect confidentiality (for example spectre v1) are listed as not covered
> > > by TDX but remaining SW responsibility (as they are now).
> >
> > Thanks for the additional info, Elena. Given that clarification, I
> > definitely see direct map removal and TDX as complementary.
>
> Jus to clarify to make sure my comment is not misunderstood.
> What I meant is that we cannot generally assume that confidentiality
> leaks from CoCo guests to host/VMM via speculative channels
> are completely impossible. Spectre V1 is a prime example of such a
> possible leak. Dave also elaborated on other potential vectors earlier.
>
> The usefulness of direct map removal for CoCo guests as a concrete
> mitigation for certain types of memory attacks must be precisely
> evaluated per each attack vector, attack vector direction (host -> guest,
> guest ->host, etc) and per each countermeasure that CoCo vendors
> provide for each such case. I don't know if there is any existing study
> that examines this for major CoCo vendors. I think this is what must
> be done for this work in order to have a strong reasoning for its usefulness.

Thanks, that makes sense. I'm a little hyperfocused on guest->host which
is the opposite direction of what is generally used for the CoCo threat
model. I think what both cases care about though is guest->guest. For
me, guest->host matters because it's a route for guest->guest (at least
in the non-CoCo world). There's some good discussion on this in David's
series on attack vector controls [1].

Like you mention, beyond direction it matters which CoCo countermeasures
are at play and how far they go during transient execution. That part is
not clear to me for the host->guest direction involving the direct map,
but agree any countermeasures like direct map removal should be
evaluated based on a better understanding of what those existing
countermeasures already cover and what attack is intended to be
mitigated.

Derek


[1] https://lore.kernel.org/lkml/LV3PR12MB92658EA6CCF18F90DAAA168394532@LV3PR12MB9265.namprd12.prod.outlook.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
