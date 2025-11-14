Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6339CE7B1E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TcQuKbNwTgqYl8hlvTxKUtHcE5lpZ1cawZ/XTBPzBY=; b=RR4HB1kUjanXcb
	ZL/+r6nPbg7In/5tG8H/hfzZ1b0IpakGjie0G80LdbVYdzcEPKv0C1jwJGzxiamEdaLjmWKSLs7l5
	yFrPsp8T87sDHN8jWafhBw/+ePugGERpVnD8+i1/CyJyRkRJp4lKmBP7BW/8IGEzEhgFZ2Zbzg1nI
	wHOyo44KO2jaNvKoWe1GdNmzF3stF1H0AnRv3yHA2pp2sAo4KjH6ltDglC+Oo42Pp6hQ/8dYuvnFB
	snC7S0p/5JUtUAWklwiuZ92R3z4HtbZ2gbdWFQGQxJSXjuRhvnM8h0itA8OGAag1KqCFvOCVxmTlk
	UrqqjjgbPln7GbSW2kcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvMh-0000000CRQY-19xt;
	Fri, 14 Nov 2025 15:05:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvMf-0000000CROx-3XJY
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mYsxd3auPHrfEyiSRiw1uwn1LfepSkxHHrao83gvKCM=; b=Pb9C9U3vYk2LH+/YR5C5jzVDZN
	jez49hfJKfGGsG0wz0i7GXZ6kN2VUKMCtgSVfWB78sjNje3/mj3bovRZb3IAavax3rsTs1lrynUfx
	Pjz6XXzh2NfFYXoxMNESJ11gOutu6327AAt9dyFPdnUWb1Ta6yo91y5XhWTUZjGLj91JWon5Xninf
	j5SBPr10HAwu/LL6dqd2d4OKhcwxJLKXMewOBiFZKWpgFdSOpo/Mzv+yA4rQfRoddkKREnyCR6Ftf
	ZS2zI8iQMu4PQGy6D5Gh9ArDfXOaYt/ly1G3QZ7Yr/PgRCkA2hlCvmw7/Oz2EYNooz8EnhYEqmgXo
	AR4nvS7Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuUy-00000002lHu-1qok
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 14:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYsxd3auPHrfEyiSRiw1uwn1LfepSkxHHrao83gvKCM=;
	b=AtMshwK68wZ/YkY2ccL73s3x/Fy4cdYKeQCJ0hWjMjqI6pZ46oMYR0/DMhAmBAq6UJVDCz
	/YmcQbR139dwGlqVo9O+yQoZ4ce4yPs1sqEbdCNsPSkbQl1cul4L64HBtxhQ9TCZehLwu1
	zvwW6k1wvsafH/2K6wYpKeCS2WWEWfQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYsxd3auPHrfEyiSRiw1uwn1LfepSkxHHrao83gvKCM=;
	b=N6g1uKFuRTiFcEG2jwBQd3Ij0T0+PiuukpTIbBD3V0SqYu9hdUYRPmyIjrykbCJYjl4EM8
	ww0M30hriB/nb5N0mNY48t3jifrKBFBOjroxWZ6Dl2GJf15L7kwNlmoQFPRThMDiFrR3zo
	cXgUfmX79sT4q1ySD6gjlsqsdASa+/g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-39-6oHxJBeGO0qqNP5iNM1MBA-1; Fri,
 14 Nov 2025 10:05:21 -0500
X-MC-Unique: 6oHxJBeGO0qqNP5iNM1MBA-1
X-Mimecast-MFC-AGG-ID: 6oHxJBeGO0qqNP5iNM1MBA_1763132716
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A25441801306;
	Fri, 14 Nov 2025 15:05:16 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0658819560B9;
	Fri, 14 Nov 2025 15:05:02 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 12/31] arm64/paravirt: Mark pv_steal_clock static call as __ro_after_init
Date: Fri, 14 Nov 2025 16:01:14 +0100
Message-ID: <20251114150133.1056710-13-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_141000_632711_9510B78F 
X-CRM114-Status: GOOD (  12.83  )
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

The static call is only ever updated in

  __init pv_time_init()
  __init xen_time_setup_guest()

so mark it appropriately as __ro_after_init.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/arm64/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index aa718d6a9274a..ad28fa23c9228 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -32,7 +32,7 @@ static u64 native_steal_clock(int cpu)
 	return 0;
 }
 
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
+DEFINE_STATIC_CALL_RO(pv_steal_clock, native_steal_clock);
 
 struct pv_time_stolen_time_region {
 	struct pvclock_vcpu_stolen_time __rcu *kaddr;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
