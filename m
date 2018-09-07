From: paulmck@linux.vnet.ibm.com (Paul E. McKenney)
Date: Thu, 6 Sep 2018 20:45:30 -0700
Subject: rcu: Make expedited GPs handle CPU 0 being offline
Message-ID: <20180907034530.GA18753@linux.vnet.ibm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello!

Please apply the following commit to the v4.18 -stable tree:

	rcu: Make expedited GPs handle CPU 0 being offline
	fcc63543650150629c8a873cbef3578770acecd9

This patch fixes a v4.18 regression that is causing the RISC-V people
(CCed) some trouble.  It is a small patch and has been tested in the
failing situation running v4.18 by Atish Patra and Andreas Schwab
(both CCed).

Please let me know if more information is required.

							Thanx, Paul
