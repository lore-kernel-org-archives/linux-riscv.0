Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E28606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2py5NWEW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Abdg4LFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wq9RJiqU/FaaT2RGvSpyBQSVvcbV2zL8HJ+v9BIxVJU=; b=2py5NWEWkwCvlK77udU0JPZEkR
	bgnQzv7gkSAnxOqQuhCMJoTKt9ryK7AoO4fhYxbujySUPiWIVAYedKYGvukwsrJ2JZJXUf7iSAFNW
	334WCYn/BkqbUPYT9YuWClpm38aU5CiNODtL0vtMs/pXGgv60+tPIF5wRHLwH/57Clo9RxfTI4BxY
	BFubYBLqEUGV0EYfzeXfOOXaEVdNSfzcYDamy6TfaJl/wjlVPbIBKrxS76yDO0fWE72PR+mMfFBCj
	w54Iz5li3jX5JMVlpPM8VQ4tHKZ+DGHc9yQcaZvz59Jov8KidPEIeTnAGeo4VixNz1K2A+kejO3w5
	ErxtZF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLoU4-00000005mFH-24ZC;
	Tue, 27 Oct 2026 21:13:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLoU0-00000005mE7-36iN
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 21:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793135601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=A6CTgTOgYlFCYkkhKt3b0AM3/EI4NmjmVT/AVxhYtRA=;
	b=Abdg4LFybpq9h6TbzQfE4t+NevgVi0WEZXETCRqPEw1g8JwjeAvYzjrqTSooCEk03apvZ5
	AguQXnD1ZRniiJ4c1yr1lKS5zRmGD3VgcAwelt8KFg8LOeXa4gwrp4/mADwBPte4YYGO2/
	aD6DE6K8yuuFDHtwPeWVR24R3MmF2A4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-2CjxF7pjPHCKbEy8vrbJRA-1; Tue,
 27 Oct 2026 17:13:20 -0400
X-MC-Unique: 2CjxF7pjPHCKbEy8vrbJRA-1
X-Mimecast-MFC-AGG-ID: 2CjxF7pjPHCKbEy8vrbJRA_1793135599
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E4BF195422F;
	Tue, 27 Oct 2026 21:13:18 +0000 (UTC)
Received: from kchamart.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1ED0F1955F08;
	Tue, 27 Oct 2026 21:13:15 +0000 (UTC)
Date: Tue, 27 Oct 2026 22:13:13 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
	kvm-riscv@lists.infradead.org
Subject: [CFP] RISC-V Devroom at FOSDEM 2027
Message-ID: <auET6VbZLtXTUDsQ@kchamart.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6QSfZ6ciYrMEY52CoPMzNXjoBIOrKa2CaQY5waxo_7g_1793135599
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_141324_852701_CE8BE463 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello!

We are pleased to announce[1] the Call for Participation (CFP) for the
RISC-V devroom at FOSDEM 2027.  

FOSDEM 2027 (https://fosdem.org/2027/) will take place on the 30th and
31st January, 2027 in Brussels, Belgium.

The RISC-V devroom is on January 31st (Sunday afternoon).

Important dates
---------------

- 01 December   2026: Talk submission deadline
- 15 December   2026: Final schedule announcement
- 31 January    2027: RISC-V devroom

About the RISC-V devroom
------------------------

The RISC-V devroom aims to bring software & firmware developers,
toolchain maintainers, and hardware designers to discuss upstreaming
efforts and hard technical problems that can't be solved over email.
This devroom is a collaborative effort, and is organized by folks
actively working in the RISC-V ecosystem.

Suggested topics
----------------

Any RISC-V-related topics that fit the spirit of free and open source
software (FOSS) are welcome.  Some topics to consider:

  - RISC-V hardware (e.g. cores, SoCs, accelerators)
  - Operating system porting, kernels, and hypervisors
  - Toolchains: compilers, linkers, and debuggers
  - Firmware and boot (e.g. OpenSBI, EDK2, U-Boot)
  - Emulation (e.g. QEMU, Spike)
  - ISA-level updates relevant to the Linux ecosystem and RVA23
    readiness
  - Performance and correctness tools (e.g. perf, Valgrind)
  - Language runtimes and their RISC-V enablement, maintenance, and
    performance (e.g. Go, OpenJDK, Node.js, Rust, Python)
  - Package ecosystems and build systems (e.g. riscv64 prebuilt packages
    and build support across npm, pip, Cargo, Maven, Go modules)
  - Applications and middleware (e.g. riscv64 porting, RVV-optimized
    code paths)

We are also interested in experience reports and technical work that
help make complete, production-relevant FOSS workloads available,
usable, and well-supported on RISC-V. 

Submit a talk
-------------

Please visit the FOSDEM 2027 Pretalx website:
https://pretalx.fosdem.org/fosdem-2027/cfp.  Your submission should
include:

- The title and subtitle of your talk (please be clear and descriptive)
- Select "RISC-V devroom" as the track
- A good abstract of a couple of paragraphs (be thoughtful with AI use)
- A short bio and contact information
- Relevant URLs

We suggest a talk length of 15-20 minutes plus 5 minutes of Q&A, since
the devroom runs for half a day this year.  With good planning, one can
pack quite a punch in 15 minutes.

Presentations will be recorded and streamed.  Sending your proposal
implies giving permission to have your presentation recorded and
distributed together with your slides under a Creative Commons CC-BY
license.


Regards,
Kashyap Chamarthy
Ludovic Henry
(On behalf of the devroom committee)

		* * *

[1] Also on the FOSDEM list:
    https://lists.fosdem.org/hyperkitty/list/fosdem@lists.fosdem.org/thread/K63XKEFUWSSZF6UTWFXFOPO5F2GNM3XX/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
