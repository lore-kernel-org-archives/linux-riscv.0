Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95209CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+LMswvy0/iBl77tT8KFbSuRWur8spUwRZ2dnIa9OcU=; b=IJ+vURytRlBOdp
	CaYE9Uy8OuocWbfbbiq9xEyLJ6C7YwtG8oddoBMT6UVZ+kwY3ffzNct2Q7hRVgQaqavGkL3EmU39Z
	HksXo3cjP3fs5nmOB3hbH2iCMcj2rVwo2IkmfpEoHQpot/Wy1cYEkPCm39YnsaJGBykGeZfVU3WiS
	tTT1Fz/Ve1lYwPfrx8qB0zC8A3ZaMcuuOTuT8Bbw1K/SKla+dYaNlNxx9GKot2DQXEEJI4bE18kG1
	Y9KlzaHsX0EvCkdTY3bM97WHlopc3yhq8g0NjmO2urqjLEPI5Ki21OVxWCDHLhTK/YEVjuTGnl6b+
	OdV12JBjK8pKAxN3qL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIR-00000008s8R-3FIW;
	Fri, 10 Oct 2025 15:44:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIP-00000008s67-42A3
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=; b=Hn3ZIfk14D/QTUoy7OKJtAL0SI
	HAZO1Hj/YaErmpNwJc0ri/yn4F3kfF9ktc9Bg20BszCQxcNDwhBkTYuQ7vwTO9TcaYVTMvcNQ+Waf
	IZasYkP1CulNHItuc/7FI+HymARenR/vRsXizC7kKHMnaXDVgkIw3FQZQVL+jTV+b5YoKv/5GRGfb
	ltigm2pfjy0bVPuA1gddZGYEZiGlleg+0Q8UKq8SCMTOu+n1H6QsAPCnwzQfwxGTweiRZKoiqVjn9
	sQ1WfdYmiusINXMV2v7JoLAAUR8QUk5tDKq5OA2+qcRIRkJIglziHIQ7o5y12tymzy1evuy71YoRa
	381ToTZg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIH-0000000DMDx-1TVv
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 15:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=;
	b=iq8fHquVC4fHvGcuuffqLFHVp1QNwAj0awL/KF0UxMPy81T1r8V5CHR8LIW3YRKo1oEli1
	sg6VQvCB/KcXPi6vZEqRiukc3hhGq651NTSmzM0tYgBshW0+rUtpl1Jjs/SLiStVrwzjj7
	7E8bMixJ2ZfUbnej68GkwxIQ/1Ep7Xo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=;
	b=iq8fHquVC4fHvGcuuffqLFHVp1QNwAj0awL/KF0UxMPy81T1r8V5CHR8LIW3YRKo1oEli1
	sg6VQvCB/KcXPi6vZEqRiukc3hhGq651NTSmzM0tYgBshW0+rUtpl1Jjs/SLiStVrwzjj7
	7E8bMixJ2ZfUbnej68GkwxIQ/1Ep7Xo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=;
	b=iq8fHquVC4fHvGcuuffqLFHVp1QNwAj0awL/KF0UxMPy81T1r8V5CHR8LIW3YRKo1oEli1
	sg6VQvCB/KcXPi6vZEqRiukc3hhGq651NTSmzM0tYgBshW0+rUtpl1Jjs/SLiStVrwzjj7
	7E8bMixJ2ZfUbnej68GkwxIQ/1Ep7Xo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-meY_oTX3Ni6d3twePwCogw-1; Fri,
 10 Oct 2025 11:44:28 -0400
X-MC-Unique: meY_oTX3Ni6d3twePwCogw-1
X-Mimecast-MFC-AGG-ID: meY_oTX3Ni6d3twePwCogw_1760111064
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 313C31800357;
	Fri, 10 Oct 2025 15:44:24 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9B8F1800576;
	Fri, 10 Oct 2025 15:44:08 +0000 (UTC)
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
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v6 14/29] perf/x86/amd: Mark perf_lopwr_cb static call as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:24 +0200
Message-ID: <20251010153839.151763-15-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164434_790721_DFA0C3C3 
X-CRM114-Status: GOOD (  12.79  )
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

Later commits will cause objtool to warn about static calls being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

perf_lopwr_cb is used in .noinstr code, but is only ever updated in __init
amd_brs_lopwr_init(), and can thus be marked as __ro_after_init.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/events/amd/brs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index 06f35a6b58a5b..71d7ba774a063 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -423,7 +423,7 @@ void noinstr perf_amd_brs_lopwr_cb(bool lopwr_in)
 	}
 }
 
-DEFINE_STATIC_CALL_NULL(perf_lopwr_cb, perf_amd_brs_lopwr_cb);
+DEFINE_STATIC_CALL_NULL_RO(perf_lopwr_cb, perf_amd_brs_lopwr_cb);
 EXPORT_STATIC_CALL_TRAMP_GPL(perf_lopwr_cb);
 
 void __init amd_brs_lopwr_init(void)
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
